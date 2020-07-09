Class {
	#name : #GenderSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #adding }
GenderSample class >> addGender1 [
	Bookflix instance addGender: 'Libros de cartón'
]

{ #category : #adding }
GenderSample class >> addGender2 [
	Bookflix instance addGender: 'Libros informativos (infantil)'
]

{ #category : #adding }
GenderSample class >> addGender3 [
	Bookflix instance addGender: 'Narrativa juvenil'
]

{ #category : #adding }
GenderSample class >> addGenders [
	self
		addGender1;
		addGender2;
		addGender3
]
