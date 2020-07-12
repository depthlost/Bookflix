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
		with: [ self renderBooksHistoryOn: html ]
]

{ #category : #seaside }
BooksHistoryComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Historial de Lectura'
]
