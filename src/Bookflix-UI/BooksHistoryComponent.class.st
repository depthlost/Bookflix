Class {
	#name : #BooksHistoryComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
BooksHistoryComponent >> renderBooksHistoryOn: html [
	html
		render:
			(ActionListComponent
				withTitle: 'Historial de Lectura'
				components:
					(self session profile historial
						collect: [ :each | BookHistoryItemComponent with: each callComponent: self ]))
]

{ #category : #rendering }
BooksHistoryComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ self session profile historial
				ifEmpty: [ self renderEmptyHistoryMessageOn: html ]
				ifNotEmpty: [ self renderBooksHistoryOn: html ] ]
]

{ #category : #rendering }
BooksHistoryComponent >> renderEmptyHistoryMessageOn: html [
	html paragraph
		class: 'mt-4';
		with: 'No se encontraron libros en el historial.'
]

{ #category : #seaside }
BooksHistoryComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Historial de Lectura'
]
