Class {
	#name : #AdminNavBarComponent,
	#superclass : #SessionNavBarComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #getting }
AdminNavBarComponent >> nickname [
	^ self session user name , ' ' , self session user surname
]

{ #category : #rendering }
AdminNavBarComponent >> renderUserTopItemsOn: html [
	super renderUserTopItemsOn: html.
	self
		renderDropdownDividerOn: html;
		renderDropdownItem: 'Agregar Libro Completo'
			withCallback: [ self session mainComponent content
				call: AddCompleteBookComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Libro por Capítulos'
			withCallback: [ self session mainComponent content
				call: AddChaptersBookComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Autor'
			withCallback: [ self session mainComponent content call: AddAuthorComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Género'
			withCallback: [ self session mainComponent content call: AddGenderComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Editorial'
			withCallback: [ self session mainComponent content call: AddEditorialComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Trailer'
			withCallback: [ self session mainComponent content call: AddTrailerComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Novedad'
			withCallback: [ self session mainComponent content call: AddNoveltyComponent new ]
			on: html
]
