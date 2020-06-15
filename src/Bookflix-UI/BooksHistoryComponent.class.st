Class {
	#name : #BooksHistoryComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-books'
}

{ #category : #rendering }
BooksHistoryComponent >> renderBooksHistoryOn: html [
	html
		render:
			(ListComponent
				withTitle: 'Historial de Lectura'
				collection: Bookflix instance getAllBooks
				do: [ :each :htmlCanvas | htmlCanvas text: each title ])
]

{ #category : #rendering }
BooksHistoryComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ self renderBooksHistoryOn: html ]
]

{ #category : #seaside }
BooksHistoryComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Historial de Lectura'
]
