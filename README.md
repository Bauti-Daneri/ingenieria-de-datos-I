# Ingeniería de Datos I — Modelado relacional y SQL

Proyecto académico de diseño y consulta de bases de datos relacionales con SQL Server. El trabajo reúne dos casos de estudio y documenta el pasaje desde el modelo conceptual hasta la implementación física.

## Casos de estudio

### Game of Thrones

Modelo relacional para representar reinos, castillos, ciudades, casas, personajes, profesiones, linajes, especies, habilidades y guerras.

### Conectar Igualdad

Modelo relacional para representar servidores, aplicaciones, computadoras, docentes, escuelas, talleres, recursos, fechas y orientaciones.

## Qué se trabajó

- Modelos conceptual, lógico y físico.
- Definición de tablas, claves primarias y foráneas.
- Restricciones de integridad y validaciones con `CHECK`.
- Carga de datos de prueba.
- Consultas con `JOIN`, filtros y agregaciones.
- Procedimientos almacenados para operaciones CRUD.
- Separación de los scripts por dominio para facilitar su revisión.

## Estructura

```text
sql/
  game_of_thrones.sql
  conectar_igualdad.sql
docs/diagrams/
  modelos conceptuales, lógicos y físicos
```

## Diagramas

Los diagramas se encuentran en [`docs/diagrams`](docs/diagrams/).

## Tecnologías

SQL Server · SQL relacional · Modelado entidad-relación · Procedimientos almacenados

## Contexto

Trabajo práctico académico realizado durante Ingeniería de Datos I. Se publica como muestra de aprendizaje y no como un sistema productivo.
