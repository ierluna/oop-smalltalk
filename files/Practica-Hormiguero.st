!classDefinition: #HormigaTest category: #'Practica-Hormiguero'!
TestCase subclass: #HormigaTest
	instanceVariableNames: 'pesoCarga'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!HormigaTest methodsFor: 'as yet unclassified' stamp: 'a 10/13/2019 14:00:53'!
test01_unaHormigaNaceYNoTieneCarga
	
	| unaHormiga |
	
	unaHormiga := Hormiga new.
	
		
	
	Assert that: unaHormiga cargaActual isEqualTo: 0*gram. ! !


!classDefinition: #TestHormiguero category: #'Practica-Hormiguero'!
TestCase subclass: #TestHormiguero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 17:15:47'!
nuevaHormiga
	^ Hormiga new.! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 16:45:04'!
test01_puedoAgregarUnaHormigaAUnHormiguero

| unHormiguero unaHormiga |
unHormiguero := Hormiguero new.
unaHormiga := self nuevaHormiga.

unHormiguero agregar: unaHormiga.

Assert that: unHormiguero cantidadDeHormigas isEqualTo: 1.
! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 16:55:27'!
test02_agregoDosHormigasDistintasYMeDevuelve2ComoSuCantidadDeHormigasEnElla

| unHormiguero unaHormiga otraHormiga |
unHormiguero := Hormiguero new.
unaHormiga := self nuevaHormiga.
otraHormiga := self nuevaHormiga.

unHormiguero agregar: unaHormiga;
				 agregar:otraHormiga.

Assert that: unHormiguero cantidadDeHormigas isEqualTo: 2.
! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 16:57:29'!
test03_unHormigueroVacioMeDevuelve0CuandoLePreguntoSuCantidadDeHormigasEnEl

| unHormiguero |
unHormiguero := Hormiguero new.


Assert that: unHormiguero cantidadDeHormigas isEqualTo: 0.
! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'a 10/13/2019 13:39:59'!
test04_HayUnaHormigaAlLimiteEnElHormiguero

| unHormiguero unaHormiga |
unHormiguero := Hormiguero new.
unaHormiga := self nuevaHormiga.

unHormiguero agregar: unaHormiga.
unaHormiga cargar: 9 * gram.

Assert that: unHormiguero cantidadDeHormigasAlLimite isEqualTo: 1.! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'a 10/13/2019 13:58:08'!
test05_lePuedoPreguntarElPesoTotalDeCargaALasHormigasAlojadasEnUnHormiguero
| unHormiguero unaHormiga otraHormiga otraHormigaMas |
unHormiguero := Hormiguero new.
unaHormiga := self nuevaHormiga.
otraHormiga:= self nuevaHormiga.
otraHormigaMas:= self nuevaHormiga.

unHormiguero agregar: unaHormiga;
				agregar: otraHormiga;
				agregar: otraHormigaMas.
				
unaHormiga cargar: 9 * gram.
otraHormiga cargar: 10 *gram.
otraHormigaMas cargar: 20*gram.

Assert that: unHormiguero cargaTotalDeHormigas isEqualTo: 39 * gram.! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'a 10/16/2019 00:42:02'!
test06_unHormigueroLePuedeReclamarATodasSusHormigas
"
| unHormiguero unaHormiga otraHormiga hormiguin |
unHormiguero := Hormiguero new.
unaHormiga := self nuevaHormiga.
otraHormiga:= self nuevaHormiga.
hormiguin:= self nuevaHormiga.

unHormiguero agregar: unaHormiga;
				agregar: otraHormiga;
				agregar: hormiguin.
				
unaHormiga cargar: 9 * gram.
otraHormiga cargar: 10 *gram.
hormiguin cargar: 20*gram.

unHormiguero reclamarComida.

Assert that: unHormiguero comidaEnDeposito isEqualTo: 39 * gram.
Assert that: unHormiguero cargaTotalDeHormigas isEqualTo: 0*gram."! !


!classDefinition: #Hormiga category: #'Practica-Hormiguero'!
Object subclass: #Hormiga
	instanceVariableNames: 'pesoCarga cargaActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!Hormiga methodsFor: 'accessing' stamp: 'a 10/13/2019 14:01:10'!
cargaActual
	^ cargaActual! !

!Hormiga methodsFor: 'accessing' stamp: 'a 10/13/2019 14:01:59'!
initialize
	cargaActual := 0*gram.! !


!Hormiga methodsFor: 'testing' stamp: 'a 10/13/2019 14:00:53'!
estaAlLimite
	^ (self cargaActual >= (9 * gram)) & (self cargaActual <= (10 * gram)).! !


!Hormiga methodsFor: 'add' stamp: 'a 10/13/2019 14:02:52'!
cargar: unaCarga 
	cargaActual _ cargaActual + unaCarga ! !


!classDefinition: #Hormiguero category: #'Practica-Hormiguero'!
Object subclass: #Hormiguero
	instanceVariableNames: 'hormigasAlojadas comidaEnDeposito'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!Hormiguero methodsFor: 'accessing' stamp: 'a 10/13/2019 13:58:40'!
cantidadDeHormigas
	^hormigasAlojadas size.! !

!Hormiguero methodsFor: 'accessing' stamp: 'a 10/13/2019 13:58:40'!
cantidadDeHormigasAlLimite
	^ hormigasAlojadas count: [:hormiga | hormiga estaAlLimite]																! !

!Hormiguero methodsFor: 'accessing' stamp: 'a 10/13/2019 14:00:53'!
cargaTotalDeHormigas
	^ hormigasAlojadas sum: [:hormiga | hormiga cargaActual ]
	! !

!Hormiguero methodsFor: 'accessing' stamp: 'a 10/13/2019 14:40:58'!
comidaEnDeposito
	^ comidaEnDeposito.! !

!Hormiguero methodsFor: 'accessing' stamp: 'a 10/13/2019 14:41:46'!
initialize
	hormigasAlojadas := Set new.
	comidaEnDeposito  := 0 *gram.! !


!Hormiguero methodsFor: 'add' stamp: 'a 10/13/2019 13:58:40'!
agregar: unaHormiga 
	hormigasAlojadas add: unaHormiga.
	! !


!Hormiguero methodsFor: 'testing' stamp: 'a 10/13/2019 13:58:40'!
tieneA: unaHormiga 
	hormigasAlojadas includes: [unaHormiga].! !


!Hormiguero methodsFor: 'as yet unclassified' stamp: 'a 10/13/2019 14:52:45'!
reclamarComida
	comidaEnDeposito _ comidaEnDeposito +  self cargaTotalDeHormigas.
	self vaciarCargas.! !

!Hormiguero methodsFor: 'as yet unclassified' stamp: 'a 10/13/2019 14:53:09'!
vaciarCargas
	self shouldBeImplemented.! !

unHormiguero agregar: unaHormiga;
				 agregar:otraHormiga.

Assert that: unHormiguero cantidadDeHormigas isEqualTo: 2.
! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 16:57:29'!
test03_unHormigueroVacioMeDevuelve0CuandoLePreguntoSuCantidadDeHormigasEnEl

| unHormiguero |
unHormiguero := Hormiguero new.


Assert that: unHormiguero cantidadDeHormigas isEqualTo: 0.
! !

!TestHormiguero methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 17:49:10'!
test04_HayUnaHormigaAlLimiteEnElHormiguero

| unHormiguero unaHormiga |
unHormiguero := Hormiguero new.
unaHormiga := self nuevaHormiga.

unHormiguero agregar: unaHormiga.
unaHormiga cargar: 9 * gram.

Assert that: unHormiguero cantidadDeHormigasAlLimite isEqualTo: 1.! !


!classDefinition: #Hormiga category: #'Practica-Hormiguero'!
Object subclass: #Hormiga
	instanceVariableNames: 'pesoCarga'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!Hormiga methodsFor: 'accessing' stamp: 'javier 10/10/2019 17:40:43'!
initialize
	pesoCarga := 0*gram.! !

!Hormiga methodsFor: 'accessing' stamp: 'javier 10/10/2019 17:11:38'!
pesoCarga
	^ pesoCarga! !


!Hormiga methodsFor: 'testing' stamp: 'javier 10/10/2019 17:35:07'!
estaAlLimite
	^ (self pesoCarga >= (9 * gram)) & (self pesoCarga <= (10 * gram)).! !


!Hormiga methodsFor: 'add' stamp: 'javier 10/10/2019 17:53:01'!
cargar: unaCarga 
	pesoCarga _ pesoCarga + unaCarga ! !


!classDefinition: #Hormiguero category: #'Practica-Hormiguero'!
Object subclass: #Hormiguero
	instanceVariableNames: 'hormigas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!Hormiguero methodsFor: 'accessing' stamp: 'javier 10/10/2019 16:23:08'!
cantidadDeHormigas
	^hormigas size.! !

!Hormiguero methodsFor: 'accessing' stamp: 'javier 10/10/2019 17:43:34'!
cantidadDeHormigasAlLimite
	^ hormigas count: [:hormiga | hormiga estaAlLimite]																! !

!Hormiguero methodsFor: 'accessing' stamp: 'javier 10/10/2019 16:17:51'!
initialize
	hormigas := Set new.! !


!Hormiguero methodsFor: 'add' stamp: 'javier 10/10/2019 16:20:04'!
agregar: unaHormiga 
	hormigas add: unaHormiga.
	! !


!Hormiguero methodsFor: 'testing' stamp: 'javier 10/10/2019 16:27:08'!
tieneA: unaHormiga 
	hormigas includes: [unaHormiga].! !
