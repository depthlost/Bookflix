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
		renderDropdownItem: 'Agregar Libro Completo'
			withCallback: [ contentComponent call: AddCompleteBookComponent new ]
			on: html;
		renderDropdownItem: 'Agregar Libro por Capítulos'
			withCallback: [ contentComponent call: AddChaptersBookComponent new ]
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
			on: html;
		renderDropdownItem: 'Agregar Novedad'
			withCallback: [ contentComponent call: AddNoveltyComponent new ]
			on: html
]
