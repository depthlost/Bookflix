Class {
	#name : #OpenIconicLibrary,
	#superclass : #Object,
	#category : #'Bookflix-UI-libraries'
}

{ #category : #adding }
OpenIconicLibrary class >> add: anHtmlRoot [
	anHtmlRoot stylesheet
		url: '/open-iconic/font/css/open-iconic-bootstrap.css'
]
