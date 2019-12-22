import 'package:flutter/material.dart';

const Color PRIMARY_COLOR = const Color.fromRGBO(0, 206, 201, 1);
const String APP_NAME = "Friendly Locations";



const String EMAIL_VERIFICATION_MESSAGE = "Es necesaria la verificación de su correo electrónico, para ello revise su bandeja de entrada";


const String HINT_USERNAME = "Nombre de usuario";
const String HINT_EMAIL = "Correo electrónico";
const String HINT_PASSWORD = "Contraseña";
const String HINT_CONFIRM_PASSWORD = "Confirmar contraseña";

const String ERROR_EMPTY_USER_NAME = "Ingrese un nombre de usuario";
const String ERROR_EMPTY_EMAIL = "Ingrese un correo electrónico";
const String ERROR_VALID_EMAIL = "Ingrese un correo electrónico válido";
const String ERROR_ALREADY_IN_USE_EMAIL = "El correo ya se encuentra registrado";
const String ERROR_EMPTY_PASSWORD = "Ingrese una contraseña";
const String ERROR_VALID_PASSWORD = "Debe contener 6 carácteres";
const String ERROR_EMPTY_PASSWORD_MATCH = "Debe confirmar la contraseña";
const String ERROR_PASSWORD_MATCH = "Las contraseñas no coinciden";
const String ERROR_INALID_EMAIL_OR_PASSWORD = "Correo y/o contraseña inválidas";

const String REGEX_EMAIL = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
const String REGEX_PASSWORD = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
