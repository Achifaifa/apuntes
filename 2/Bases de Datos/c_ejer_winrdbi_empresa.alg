%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% REALIZA LOS SIGUIENTES EJERCICIOS EN ÁLGEBRA RELACIONAL (SINTAXIS WINRDBI)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.- Empleados que trabajan en el departamento 4
emp4:=select nd=4 (empleado);

%2.- Nombre de los empleados del departamento 4
nomemp4:=project nombre(emp4);

%3.- Nombres de departamento junto con el nombre de su jefe
jefesdepto:=project nombred,nombre (select nss=nssjefe (empleado product departamento));

%4.- Nombres de departamento junto con el nombre de su jefe. Usando natural join
depto(nombred, nss):=project nombred,nssjefe (departamento);
jefesdepto2:=project nombred,nombre  (empleado njoin depto);

%5.- nombres de empleado igual al de algún familiar
p1:=project nombre (empleado);
p2(nombre):=project nombredependiente(dependiente);
restult:= p1  intersect p2;

%5a.- nombres de empleado igual al de alguno de sus  familiares
empleados :=project nss,nombre (empleado);
familiares(nss,nombre):=project nsse,nombredependiente (dependiente);
resultados5a:=empleados njoin familiares

%6.- Nombre de los empleados para los que no tenemos familiares almacenados
todosemp:=project nss (empleado);
empfamiliar(nss):=project nsse(dependiente);
empsin:=todosemp difference empfamiliar;
nombressin:=project nombre(empsin njoin empleado);
