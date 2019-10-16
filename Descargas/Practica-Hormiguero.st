!classDefinition: #HormigaTest category: #'Practica-Hormiguero'!
TestCase subclass: #HormigaTest
	instanceVariableNames: 'pesoCarga'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Hormiguero'!

!HormigaTest methodsFor: 'as yet unclassified' stamp: 'javier 10/10/2019 17:41:01'!
test01_unaHormigaNaceYNoTieneCarga
	
	| unaHormiga |
	
	unaHormiga := Hormiga new.
	
		
	
	Assert that: unaHormiga pesoCarga isEqualTo: 0*gram. ! !


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
