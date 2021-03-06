CREATE TABLE TELEFONO_X_PERSONA(
    TELEFONO_ID INT(8) NOT NULL,
    PERSONA_ID INT(8) NOT NULL,
    PRIMARY KEY(TELEFONO_ID, PERSONA_ID),
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10),
    FOREIGN KEY (TELEFONO_ID) 
	REFERENCES TELEFONO(TELEFONO_ID),
    FOREIGN KEY (PERSONA_ID) 
	REFERENCES PERSONA(PERSONA_ID)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_TELEFONO_X_PERSONA
  BEFORE INSERT ON TELEFONO_X_PERSONA FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_TELEFONO_X_PERSONA
  BEFORE UPDATE ON PROGRA_2.TELEFONO_X_PERSONA FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$