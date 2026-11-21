#Makefile p3 - Sergio y Carla

C = gcc
CFLAGS1 = -lfl
CFLAGS2 = -lfl -lm
SRCS = lex.yy.c y.tab.c

.PHONY: all clean test test21 test22 test23 test3 test-all

#compila todos los ejercicios
all: ej21 ej22 ej23 ej3

#ejercicio 2.1.
ej21: ej21.l ej21.y
	bison -yd ej21.y
	flex ej21.l
	$(C) $(SRCS) $(CFLAGS2) -o ej21
	
#ejercicio 2.2.
ej22: ej22.l ej22.y
	bison -yd ej22.y
	flex ej22.l
	$(C) $(SRCS) $(CFLAGS2) -o ej22
	
#ejercicio 2.3.
ej23: ej23.l ej23.y
	bison -yd ej23.y
	flex ej23.l
	$(C) $(SRCS) $(CFLAGS2) -o ej23
	
#ejercicio 3.
ej3: ej3.l ej3.y
	bison -yd ej3.y
	flex ej3.l
	$(C) $(SRCS) $(CFLAGS1) -o ej3

#Pruebas ejercicio 2.1.
test21: ej21
		@echo "PRUEBAS EJERCICIO 2.1."
		@echo ".10 + 3.12 + 2. + 3" | ./ej21
		@echo "4 * 3 + 2" | ./ej21
		@echo "10 / 4" | ./ej21
		@echo ""
		
		
#Pruebas ejercicio 2.2.
test22: ej22
		@echo "PRUEBAS EJERCICIO 2.2."
		@echo "2**3" | ./ej22
		@echo "2**3**2 (Debe dar: 2^(3^2) = 512, se asocia por la derecha)" | ./ej22
		@echo "2 * 3 **2 (Debe dar 2* (3^2) = 18, precede la potencia)" | ./ej22
		@echo ""
		

#Pruebas ejercicio 2.3.
test23: ej23
		@echo "PRUEBAS EJERCICIO 2.3."
		@echo "[2-5]" | ./ej23
		@echo "[2-5] ** 2 * 2" | ./ej23
		@echo ""
		
		
#Pruebas ejercicio 3.
test3: ej3
		@echo "PRUEBAS EJERCICIO 3."
		@echo "Prueba: zx -> debe ser válida"
		@echo "zx" | ./ej3
		@echo "Prueba: zxzx -> debe ser válida"
		@echo "zxzx" | ./ej3
		@echo "Prueba: zxy -> debe ser inválida"
		@echo "zxy" | ./ej3
		@echo ""
		
#Ejecutar todas
test-all: test21 test22 test23 test3

#limpiar
clean:
	rm -f lex.yy.c y.tab.c y.tab.h ej21 ej22 ej23 ej3

