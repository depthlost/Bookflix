Class {
	#name : #ReadableAdminComponent,
	#superclass : #ReadableComponent,
	#instVars : [
		'readableComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
ReadableAdminComponent class >> decorateTo: aReadableComponent [
	^ (self
		with: aReadableComponent readable
		in: aReadableComponent parentComponent)
		readableComponent: aReadableComponent
]

{ #category : #callbacks }
ReadableAdminComponent >> goToModifyReadable [
	parentComponent
		call:
			(readable className = 'Novelty'
				ifTrue: [ SetNoveltyComponent with: readable ]
				ifFalse: [ SetBookComponent with: readable ])
]

{ #category : #initialization }
ReadableAdminComponent >> readableComponent: aReadableComponent [
	readableComponent := aReadableComponent
]

{ #category : #callbacks }
ReadableAdminComponent >> removeReadable [
	"por el momento solo borra libros"

	Bookflix instance removeBook: readable.
	parentComponent
		addAlert: (AlertComponent with: 'Se elimino "' , readable title , '" con exito')
]

{ #category : #rendering }
ReadableAdminComponent >> renderBookContentOn: html [
	super renderBookContentOn: html.
	self renderBookFooterOn: html
]

{ #category : #rendering }
ReadableAdminComponent >> renderCardOn: html [
	readableComponent renderCardOn: html.
	self renderFooterOn: html
]

{ #category : #rendering }
ReadableAdminComponent >> renderFooterOn: html [
	html div
		class: 'card-footer text-right';
		with: [ self renderModifyButtonOn: html.
			readable className = 'Novelty'
				ifFalse: [ self renderRemoveButtonOn: html ] ]
]

{ #category : #rendering }
ReadableAdminComponent >> renderModifyButtonOn: html [
	html anchor
		class: 'text-primary';
		callback: [ self goToModifyReadable ];
		with: 'Modificar'
]

{ #category : #rendering }
ReadableAdminComponent >> renderRemoveButtonOn: html [
	html anchor
		class: 'text-danger ml-3';
		attributeAt: 'href' put: '';
		attributeAt: 'data-toggle' put: 'modal';
		attributeAt: 'data-target'
			put: '#remove_readable_' , readable hash asString , '_modal';
		with: 'Borrar'.
	self
		renderRemoveModalWithId: 'remove_readable_' , readable hash asString , '_modal'
		on: html
]

{ #category : #rendering }
ReadableAdminComponent >> renderRemoveModalWithId: anId on: html [
	html
		html:
			'<div class="modal fade" id="' , anId
				, '" tabindex="-1" role="dialog" aria-labelledby="' , anId
				,
					'_label" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="' , anId , '_label">Borrar "'
				, readable title
				,
					'"</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body text-left"><p>¿Seguro que deseas borrar "'
				, readable title
				,
					'"?</p></div>
        <div class="modal-footer"><button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>'.
	html anchor
		class: 'btn btn-danger';
		callback: [ self removeReadable ];
		with: 'Borrar'.
	html
		html:
			'</div>
      </div>
    </div>
  </div>'
]
