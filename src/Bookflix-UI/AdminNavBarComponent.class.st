Class {
	#name : #AdminNavBarComponent,
	#superclass : #UserNavBarComponent,
	#category : #'Bookflix-UI'
}

{ #category : #callbacks }
AdminNavBarComponent >> goToAddBook [
	rootComponent updateContentTo: RegisterCompleteBookComponent new
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
