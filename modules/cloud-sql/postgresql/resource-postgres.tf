########  Postgres Zentown #########

resource "google_sql_database_instance" "OMS-BD" {
  # El nombre de la instancia 
  name = "${var.name_postgre}"
  # La versión de MySQL o PostgreSQL a usar MYSQL_5_6
  database_version = "${var.database_version}"
  # La región en la que se ubicará la instancia
  region       = "${var.region_postgres}"
  settings {
    tier = "${var.instance_type}"
  }
}

#### Crear base de datos 
resource "google_sql_database" "OMS-BD" {
  # El nombre de la basedatos 
  name      = "${var.name_bd}"
  # Se hace referencia al nombre de la instancia
  instance  = "${google_sql_database_instance.OMS-BD.name}"
  charset   = "${var.ecoding}"
  collation = "${var.collation}"
}

#### Crear Usuarios

resource "google_sql_user" "user_01" {
  # Nombre de Usuario
  name     = "${var.master_user}"
  instance = "${google_sql_database_instance.OMS-BD.name}"
  # contraseña de Usuario
  password = "${var.master_pass}"
}
