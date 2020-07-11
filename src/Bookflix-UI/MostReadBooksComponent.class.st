Class {
	#name : #MostReadBooksComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-admin'
}

{ #category : #rendering }
MostReadBooksComponent >> renderBookListOn: html [
	html
		render:
			(ActionListComponent
				withTitle: 'Libros mas leidos'
				components:
					(Bookflix instance getAllBooks
						collect: [ :each | BookReportItemComponent with: each callComponent: self ]))
]

{ #category : #rendering }
MostReadBooksComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ self renderBookListOn: html ]
]

{ #category : #seaside }
MostReadBooksComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Reporte de Libros'
]
