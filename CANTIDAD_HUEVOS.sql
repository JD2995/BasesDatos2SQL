/* Autor: JAVIER RIVAS */
CREATE TABLE CANTIDAD_HUEVOS(
	CANTIDAD_HUEVOS_ID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CANTIDAD VARCHAR(30) unique,
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_CANT_HUEVOS
  BEFORE INSERT ON CANTIDAD_HUEVOS FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_CANT_HUEVOS
  BEFORE UPDATE ON PROGRA_2.CANTIDAD_HUEVOS FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$ 
