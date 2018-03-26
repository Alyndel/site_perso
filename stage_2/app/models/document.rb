class Document < ApplicationRecord
	belongs_to :formation

	has_attached_file :document, styles: { }
  validates_attachment :document, content_type: { content_type: ["application/pdf",
  	                                                             "application/msword",
  	                                                             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
  	                                                             "application/vnd.oasis.opendocument.presentation",
  	                                                             "application/vnd.oasis.opendocument.spreadsheet",
  	                                                             "application/vnd.oasis.opendocument.text",
  	                                                             "application/vnd.ms-powerpoint",
  	                                                             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  	                                                             "application/vnd.ms-excel",
  	                                                             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] }
  
end
