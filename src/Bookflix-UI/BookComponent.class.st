Class {
	#name : #BookComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI'
}

{ #category : #rendering }
BookComponent >> renderContentOn: html [
	html text: 'hello!'
]
