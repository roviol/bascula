-- Reemplace CAMBIAR por una contraseña fuerte antes de ejecutar
CREATE USER 'bascula'@'localhost' IDENTIFIED BY 'CAMBIAR';
GRANT ALL PRIVILEGES ON bascula.* TO 'bascula'@'localhost';
