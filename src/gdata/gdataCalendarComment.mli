type calendar_calendarCommentEntry =
    GdataComment.Make(GdataCalendar.Link).commentEntry

val empty_commentEntry : calendar_calendarCommentEntry

type calendar_calendarCommentFeed =
    GdataComment.Make(GdataCalendar.Link).commentFeed

val empty_commentFeed : calendar_calendarCommentFeed

type calendar_calendarComments =
    GdataComment.Make(GdataCalendar.Link).comments

val empty_comments : calendar_calendarComments

val parse_comments :
  calendar_calendarComments ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarComments

val parse_comment_feed :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarCommentFeed

val parse_comment_entry :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarCommentEntry

val render_comments :
  calendar_calendarComments ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

