Class {
	#name : #AdminUser,
	#superclass : #User,
	#category : #'Bookflix-Model'
}

{ #category : #initialization }
AdminUser class >> name: aName surname: aSurname email: anEmail password: aPassword birthdate: aBirthdate [
	^ self new
		name: aName
			surname: aSurname
			email: anEmail
			password: aPassword
			birthdate: aBirthdate;
		yourself
]

{ #category : #abstract }
AdminUser >> isAdmin [
	^ true
]
