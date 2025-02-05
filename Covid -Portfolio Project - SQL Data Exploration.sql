use covid;
select * from CovidDeaths$
where continent is not null
order by 3,4;

--select data that we are going to use

select location,date, total_cases, new_cases,total_deaths,population 
from CovidDeaths$;

--Looking at Total Cases vs Total Deaths
--shows likelihood of dying if you contract covid in your country

select location,date, total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where location like '%states%'
and continent is not null
order by 1,2;

-- Looking at Total Cases vs Population
-- shows what percentage of population got covid

select location,date,population, total_cases,(total_cases/population)*100 as DeathPercentage
from CovidDeaths$
--where location like '%states%'
where continent is not null
order by 1,2;


--Looking at Countries with highest Infection rate compared to population
select location,population, max( total_cases) as HighestInfectedCount ,max((total_cases/population)*100) as  PercentagePopulationInfected
from CovidDeaths$
where continent is not null
group by location,population
order by PercentagePopulationInfected DESC ;

--showing countries with highest Death count per Population
select location, max( cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths$
where continent is not null
group by location
order by TotalDeathCount DESC ;

--LET'S BREAK THINGS BY CONTINENT



--showing the continent with highest death count per population
select continent, max( cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths$
where continent is not null
group by continent
order by TotalDeathCount DESC ;


-- Global Numbers
select sum(new_cases) as total_cases,
sum(cast(new_deaths as int)) as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from CovidDeaths$
--where location like '%states%'
where continent is not null
--group by date
order by 1,2; 

--looking at total population vs vaccination
select dea.continent,dea.location,
dea.date,dea.population,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location,dea.Date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac 
on dea.location= vac.location 
and dea.date=vac.date
where dea.continent is not null
order by  2,3;

--use CTE
with popvvac (Continent,Location,Date,Population,new_vaccinations,RollingPeopleVaccinated)
as
(select dea.continent,dea.location,
dea.date,dea.population,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.Location, dea.Date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac 
on dea.location= vac.location 
and dea.date=vac.date
where dea.continent is not null
--order by  2,3
)

select *,(RollingPeopleVaccinated/Population)*100
from popvvac;

--Temp Table

Drop table if exists  #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccination numeric,
RollingPeopleVaccinated numeric
)


insert into #PercentPopulationVaccinated
select dea.continent,dea.location,
dea.date,dea.population,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.Location, dea.Date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac 
on dea.location= vac.location 
and dea.date=vac.date
--where dea.continent is not null
--order by  2,3

select *,(RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated


---creating view to store data fro later visulaizations

create view PercentPopulationVaccinated as
select dea.continent,dea.location,
dea.date,dea.population,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.Location, dea.Date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac 
on dea.location= vac.location 
and dea.date=vac.date
where dea.continent is not null
--order by  2,3

select * from PercentPopulationVaccinated;



