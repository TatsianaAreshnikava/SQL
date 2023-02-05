-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary
from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.employee_id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary 
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.employee_id = salary.id
where salary.monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.id, salary.monthly_salary 
from employee_salary 
right join salary on employee_salary.salary_id = salary.id
where employee_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.id, salary.monthly_salary 
from employee_salary 
right join salary on employee_salary.salary_id = salary.id
where employee_salary.employee_id is null and salary.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name 
from roles_employee  
left join employee_salary  on roles_employee.employee_id =  employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id
where employee_salary.salary_id is null;

-- 6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from employees  
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Java%';

-- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name
from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA%' ;
