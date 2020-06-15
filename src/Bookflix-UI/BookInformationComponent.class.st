Class {
	#name : #BookInformationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #constructor }
BookInformationComponent class >> with: aBook [
	^ self new with: aBook
]

{ #category : #rendering }
BookInformationComponent >> listFooterWith: aDescription on: html [
	^ [ html small
		class: 'text-muted';
		with: aDescription ]
]

{ #category : #rendering }
BookInformationComponent >> listItemName: aName with: aDescription on: html [
	^ [ html div
		class: 'row px-3';
		with: [ html div
				style: 'width: 100px';
				with: aName.
			html div
				class: 'col';
				with: aDescription ] ]
]

{ #category : #rendering }
BookInformationComponent >> listOfBookInformationOn: html [
	^ ListComponent
		withTitle: 'Información'
		blocks:
			{(self listItemName: 'Titulo' with: book title on: html).
			(self listItemName: 'Descripcion' with: book description on: html).
			(self listItemName: 'ISBN' with: book isbn on: html).
			(self listItemName: 'Autor' with: book author on: html).
			(self listItemName: 'Editorial' with: book editorial on: html).
			(self listItemName: 'Generos' with: book genders on: html).
			(self
				listItemName: 'Vencimiento'
				with: book expirationDate ddmmyyyy
				on: html).
			(self listFooterWith: 'Subido el ' , book date ddmmyyyy on: html)}
				asOrderedCollection
]

{ #category : #rendering }
BookInformationComponent >> renderContentOn: html [
	html render: (self listOfBookInformationOn: html)
]

{ #category : #initialization }
BookInformationComponent >> with: aBook [
	book := aBook
]
