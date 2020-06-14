Class {
	#name : #AdminNavBarComponent,
	#superclass : #UserNavBarComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #rendering }
AdminNavBarComponent >> renderUserTopItemsOn: html [
	super renderUserTopItemsOn: html.
	self
		renderDropdownDividerOn: html;
		renderDropdownItem: 'Agregar Libro'
			withCallback: [ contentComponent call: AddBookComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Autor'
			withCallback: [ contentComponent call: AddAuthorComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Género'
			withCallback: [ contentComponent call: AddGenderComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Editorial'
			withCallback: [ contentComponent call: AddEditorialComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Trailer'
			withCallback: [ contentComponent call: AddTrailerComponent new ]
			on: html
]
