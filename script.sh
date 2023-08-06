#!/bin/bash

# Comprobar si se está ejecutando como root
if [ "$EUID" -ne 0 ]; then
  echo ""
  echo "---- Este script debe ejecutarse como root ----"
  echo ""
  exit 1
else
  echo ""
  echo "---- El usuario actual cuenta con privilegios de root ----"
  echo ""
  echo "---- Iniciando el Script...... ----"
  echo ""
fi

# Instalación de dependencias en el Back
echo "---- Ejecutando npm i en BACK ----"
echo ""
cd backend
npm i --force
echo ""
echo "---- npm i ejecutado con exito ----"
echo ""

# Instalación de dependencias en el Front
echo "---- Ejecutando npm i en FRONT ----"
echo ""
cd frontend
npm i --force
echo ""
echo "---- npm i ejecutado con exito ----"
echo ""


echo ""
echo "---- Generando env del Front ----"
# Ruta completa del archivo .env que deseas crear
ARCHIVO_ENV_FRONT="frontend/.env"

# Comprobamos si el archivo .env del front ya existe
if [ -e "$ARCHIVO_ENV_FRONT" ]; then
    echo "El archivo $ARCHIVO_ENV_FRONT ya existe."
fi


cat << EOF > "$ARCHIVO_ENV_FRONT"
VITE_BACKEND_URL='http://localhost:3001'
EOF

echo "Archivo .env del Front creado exitosamente."

echo ""
echo "---- Generando env del Back ----"
ARCHIVO_ENV_BACK="backend/.env"

# Comprobamos si el archivo .env del front ya existe
if [ -e "$ARCHIVO_ENV_BACK" ]; then
    echo "El archivo $ARCHIVO_ENV_BACK ya existe."
fi

echo "FAVOR INGRESAR HOSTNAME DE LA BASE DE DATOS POSTGRES EJ: localhost"
read IP_POSTGRES

echo "FAVOR INGRESAR EL PUERTO DEL SERVIDOR DE LA BASE DE DATOS EJ: 5432"
read PUERTO_POSTGRES

echo "FAVOR INGRESAR EL USUARIO DEL SERVIDOR DE LA BASE DE DATOS EJ: postgres"
read USUARIO_POSTGRES

echo "FAVOR INGRESAR LA CONTRASEÑA DEL USUARIO DEL SERVIDOR DE LA BASE DE DATOS EJ: postgres"
read PASSWORD_POSTGRES

echo "FAVOR INGRESAR EL NOMBRE DE LA BASE DE DATOS EJ: notesapp_database"
read DB_POSTGRES




# Crear y escribir en el archivo .env
cat << EOF > "$ARCHIVO_ENV_BACK"
DATABASE_URL='postgresql://$USUARIO_POSTGRES:$PASSWORD_POSTGRES@$IP_POSTGRES:$PUERTO_POSTGRES/$DB_POSTGRES'
CORS='http://localhost:5173'
JWT_SECRET='12345678'
EOF

echo "Archivo .env del Back creado exitosamente."





# Generación de la base de datos 
echo "---- Generando base de datos ----"
cd backend
npx prisma db push
echo ""
echo "---- Base de datos generada correctamente ----"
echo ""

#ejecucion del pisma generate
echo "---- Ejecutando npx prisma generate ----"
cd backend 
npx prisma generate
echo ""
echo "---- Comando Ejecutado con exito ----"



echo ""
echo "---- Script Finalizado ----"
echo ""
echo ""



