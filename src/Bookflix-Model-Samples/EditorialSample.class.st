Class {
	#name : #EditorialSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #adding }
EditorialSample class >> addEditorial1 [
	Bookflix instance addEditorial: 'Juventud'
]

{ #category : #adding }
EditorialSample class >> addEditorials [
	self addEditorial1
]
