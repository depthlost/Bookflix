Class {
	#name : #AdminNavBarComponent,
	#superclass : #UserNavBarComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #callbacks }
AdminNavBarComponent >> goToAddBook [
	parentComponent addContent: AddBookComponent new
]

{ #category : #rendering }
AdminNavBarComponent >> renderItemUserDropdownOn: html [
	self
		renderDropdownItem: 'Perfil'
			withCallback: [ self goToUserProfile ]
			on: html;
		renderDropdownDividerOn: html;
		renderDropdownItem: 'Agregar Libro'
			withCallback: [ self goToAddBook ]
			on: html;
		renderDropdownItem: 'Cerrar Sesión'
			withCallback: [ self logout ]
			on: html
]
