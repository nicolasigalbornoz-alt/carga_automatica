#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Comenzara a tipear automaticamente al pulsar F1
; Para frenarlo tienen que dar click derecho en el icono que figura en la barra de inicio abajo a la derecha y despues "Exit"
; Pegar todo lo que quieras que tipee abajo de "F1::"
; Eliminar espacios exepto el unico espacio que tiene "Send ". Para reemplazar pulsar "Ctrl H"

F1::

Send presupuesto2020{Enter}

return