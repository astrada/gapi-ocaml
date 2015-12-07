(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for BigQuery API (v2).
  
  For more information about this data model, see the
  {{:https://cloud.google.com/bigquery/}API Documentation}.
  *)

module UserDefinedFunctionResource :
sig
  type t = {
    inlineCode : string;
    (** \[Pick one\] An inline resource that contains code for a user-defined function (UDF). Providing a inline code resource is equivalent to providing a URI for a file containing the same code. *)
    resourceUri : string;
    (** \[Pick one\] A code resource to load from a Google Cloud Storage URI (gs://bucket/path). *)
    
  }
  
  val inlineCode : (t, string) GapiLens.t
  val resourceUri : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CsvOptions :
sig
  type t = {
    allowJaggedRows : bool;
    (** \[Optional\] Indicates if BigQuery should accept rows that are missing trailing optional columns. If true, BigQuery treats missing trailing columns as null values. If false, records with missing trailing columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. *)
    allowQuotedNewlines : bool;
    (** \[Optional\] Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file. The default value is false. *)
    encoding : string;
    (** \[Optional\] The character encoding of the data. The supported values are UTF-8 or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the raw, binary data has been split using the values of the quote and fieldDelimiter properties. *)
    fieldDelimiter : string;
    (** \[Optional\] The separator for fields in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. BigQuery also supports the escape sequence "\t" to specify a tab separator. The default value is a comma (','). *)
    quote : string;
    (** \[Optional\] The value that is used to quote data sections in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. The default value is a double-quote ('"'). If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the allowQuotedNewlines property to true. *)
    skipLeadingRows : int;
    (** \[Optional\] The number of rows at the top of a CSV file that BigQuery will skip when reading the data. The default value is 0. This property is useful if you have header rows in the file that should be skipped. *)
    
  }
  
  val allowJaggedRows : (t, bool) GapiLens.t
  val allowQuotedNewlines : (t, bool) GapiLens.t
  val encoding : (t, string) GapiLens.t
  val fieldDelimiter : (t, string) GapiLens.t
  val quote : (t, string) GapiLens.t
  val skipLeadingRows : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableFieldSchema :
sig
  type t = {
    description : string;
    (** \[Optional\] The field description. The maximum length is 16K characters. *)
    fields : t list;
    (** \[Optional\] Describes the nested schema fields if the type property is set to RECORD. *)
    mode : string;
    (** \[Optional\] The field mode. Possible values include NULLABLE, REQUIRED and REPEATED. The default value is NULLABLE. *)
    name : string;
    (** \[Required\] The field name. The name must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_), and must start with a letter or underscore. The maximum length is 128 characters. *)
    _type : string;
    (** \[Required\] The field data type. Possible values include STRING, INTEGER, FLOAT, BOOLEAN, TIMESTAMP or RECORD (where RECORD indicates that the field contains a nested schema). *)
    
  }
  
  val description : (t, string) GapiLens.t
  val fields : (t, t list) GapiLens.t
  val mode : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableSchema :
sig
  type t = {
    fields : TableFieldSchema.t list;
    (** Describes the fields in a table. *)
    
  }
  
  val fields : (t, TableFieldSchema.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ExternalDataConfiguration :
sig
  type t = {
    compression : string;
    (** \[Optional\] The compression type of the data source. Possible values include GZIP and NONE. The default value is NONE. This setting is ignored for Google Cloud Datastore backups. *)
    csvOptions : CsvOptions.t;
    (** Additional properties to set if sourceFormat is set to CSV. *)
    ignoreUnknownValues : bool;
    (** \[Optional\] Indicates if BigQuery should allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. The sourceFormat property determines what BigQuery treats as an extra value: CSV: Trailing columns JSON: Named values that don't match any column names Google Cloud Datastore backups: This setting is ignored. *)
    maxBadRecords : int;
    (** \[Optional\] The maximum number of bad records that BigQuery can ignore when reading data. If the number of bad records exceeds this value, an invalid error is returned in the job result. The default value is 0, which requires that all records are valid. This setting is ignored for Google Cloud Datastore backups. *)
    schema : TableSchema.t;
    (** \[Optional\] The schema for the data. Schema is required for CSV and JSON formats. Schema is disallowed for Google Cloud Datastore backups. *)
    sourceFormat : string;
    (** \[Required\] The data format. For CSV files, specify "CSV". For newline-delimited JSON, specify "NEWLINE_DELIMITED_JSON". For Google Cloud Datastore backups, specify "DATASTORE_BACKUP". *)
    sourceUris : string list;
    (** \[Required\] The fully-qualified URIs that point to your data in Google Cloud Storage. Each URI can contain one '*' wildcard character and it must come after the 'bucket' name. Size limits related to load jobs apply to external data sources, plus an additional limit of 10 GB maximum size across all URIs. For Google Cloud Datastore backups, exactly one URI can be specified, and it must end with '.backup_info'. Also, the '*' wildcard character is not allowed. *)
    
  }
  
  val compression : (t, string) GapiLens.t
  val csvOptions : (t, CsvOptions.t) GapiLens.t
  val ignoreUnknownValues : (t, bool) GapiLens.t
  val maxBadRecords : (t, int) GapiLens.t
  val schema : (t, TableSchema.t) GapiLens.t
  val sourceFormat : (t, string) GapiLens.t
  val sourceUris : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DatasetReference :
sig
  type t = {
    datasetId : string;
    (** \[Required\] A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. *)
    projectId : string;
    (** \[Optional\] The ID of the project containing this dataset. *)
    
  }
  
  val datasetId : (t, string) GapiLens.t
  val projectId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableReference :
sig
  type t = {
    datasetId : string;
    (** \[Required\] The ID of the dataset containing this table. *)
    projectId : string;
    (** \[Required\] The ID of the project containing this table. *)
    tableId : string;
    (** \[Required\] The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. *)
    
  }
  
  val datasetId : (t, string) GapiLens.t
  val projectId : (t, string) GapiLens.t
  val tableId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobConfigurationQuery :
sig
  type t = {
    allowLargeResults : bool;
    (** If true, allows the query to produce arbitrarily large result tables at a slight cost in performance. Requires destinationTable to be set. *)
    createDisposition : string;
    (** \[Optional\] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    defaultDataset : DatasetReference.t;
    (** \[Optional\] Specifies the default dataset to use for unqualified table names in the query. *)
    destinationTable : TableReference.t;
    (** \[Optional\] Describes the table where the query results should be stored. If not present, a new table will be created to store the results. *)
    flattenResults : bool;
    (** \[Optional\] Flattens all nested and repeated fields in the query results. The default value is true. allowLargeResults must be true if this is set to false. *)
    preserveNulls : bool;
    (** \[Deprecated\] This property is deprecated. *)
    priority : string;
    (** \[Optional\] Specifies a priority for the query. Possible values include INTERACTIVE and BATCH. The default value is INTERACTIVE. *)
    query : string;
    (** \[Required\] BigQuery SQL query to execute. *)
    tableDefinitions : (string * ExternalDataConfiguration.t) list;
    (** \[Experimental\] If querying an external data source outside of BigQuery, describes the data format, location and other properties of the data source. By defining these properties, the data source can then be queried as if it were a standard BigQuery table. *)
    useQueryCache : bool;
    (** \[Optional\] Whether to look for the result in the query cache. The query cache is a best-effort cache that will be flushed whenever tables in the query are modified. Moreover, the query cache is only available when a query does not have a destination table specified. The default value is true. *)
    userDefinedFunctionResources : UserDefinedFunctionResource.t list;
    (** \[Experimental\] Describes user-defined function resources used in the query. *)
    writeDisposition : string;
    (** \[Optional\] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_EMPTY. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    
  }
  
  val allowLargeResults : (t, bool) GapiLens.t
  val createDisposition : (t, string) GapiLens.t
  val defaultDataset : (t, DatasetReference.t) GapiLens.t
  val destinationTable : (t, TableReference.t) GapiLens.t
  val flattenResults : (t, bool) GapiLens.t
  val preserveNulls : (t, bool) GapiLens.t
  val priority : (t, string) GapiLens.t
  val query : (t, string) GapiLens.t
  val tableDefinitions : (t, (string * ExternalDataConfiguration.t) list) GapiLens.t
  val useQueryCache : (t, bool) GapiLens.t
  val userDefinedFunctionResources : (t, UserDefinedFunctionResource.t list) GapiLens.t
  val writeDisposition : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ErrorProto :
sig
  type t = {
    debugInfo : string;
    (** Debugging information. This property is internal to Google and should not be used. *)
    location : string;
    (** Specifies where the error occurred, if present. *)
    message : string;
    (** A human-readable description of the error. *)
    reason : string;
    (** A short error code that summarizes the error. *)
    
  }
  
  val debugInfo : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val message : (t, string) GapiLens.t
  val reason : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobStatus :
sig
  type t = {
    errorResult : ErrorProto.t;
    (** \[Output-only\] Final error result of the job. If present, indicates that the job has completed and was unsuccessful. *)
    errors : ErrorProto.t list;
    (** \[Output-only\] All errors encountered during the running of the job. Errors here do not necessarily mean that the job has completed or was unsuccessful. *)
    state : string;
    (** \[Output-only\] Running state of the job. *)
    
  }
  
  val errorResult : (t, ErrorProto.t) GapiLens.t
  val errors : (t, ErrorProto.t list) GapiLens.t
  val state : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobStatistics3 :
sig
  type t = {
    inputFileBytes : int64;
    (** \[Output-only\] Number of bytes of source data in a load job. *)
    inputFiles : int64;
    (** \[Output-only\] Number of source files in a load job. *)
    outputBytes : int64;
    (** \[Output-only\] Size of the loaded data in bytes. Note that while a load job is in the running state, this value may change. *)
    outputRows : int64;
    (** \[Output-only\] Number of rows imported in a load job. Note that while an import job is in the running state, this value may change. *)
    
  }
  
  val inputFileBytes : (t, int64) GapiLens.t
  val inputFiles : (t, int64) GapiLens.t
  val outputBytes : (t, int64) GapiLens.t
  val outputRows : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobStatistics4 :
sig
  type t = {
    destinationUriFileCounts : int64 list;
    (** \[Output-only\] Number of files per destination URI or URI pattern specified in the extract configuration. These values will be in the same order as the URIs specified in the 'destinationUris' field. *)
    
  }
  
  val destinationUriFileCounts : (t, int64 list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ExplainQueryStep :
sig
  type t = {
    kind : string;
    (** Machine-readable operation type. *)
    substeps : string list;
    (** Human-readable stage descriptions. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val substeps : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ExplainQueryStage :
sig
  type t = {
    computeRatioAvg : float;
    (** Relative amount of time the average shard spent on CPU-bound tasks. *)
    computeRatioMax : float;
    (** Relative amount of time the slowest shard spent on CPU-bound tasks. *)
    id : int64;
    (** Unique ID for stage within plan. *)
    name : string;
    (** Human-readable name for stage. *)
    readRatioAvg : float;
    (** Relative amount of time the average shard spent reading input. *)
    readRatioMax : float;
    (** Relative amount of time the slowest shard spent reading input. *)
    recordsRead : int64;
    (** Number of records read into the stage. *)
    recordsWritten : int64;
    (** Number of records written by the stage. *)
    steps : ExplainQueryStep.t list;
    (** List of operations within the stage in dependency order (approximately chronological). *)
    waitRatioAvg : float;
    (** Relative amount of time the average shard spent waiting to be scheduled. *)
    waitRatioMax : float;
    (** Relative amount of time the slowest shard spent waiting to be scheduled. *)
    writeRatioAvg : float;
    (** Relative amount of time the average shard spent on writing output. *)
    writeRatioMax : float;
    (** Relative amount of time the slowest shard spent on writing output. *)
    
  }
  
  val computeRatioAvg : (t, float) GapiLens.t
  val computeRatioMax : (t, float) GapiLens.t
  val id : (t, int64) GapiLens.t
  val name : (t, string) GapiLens.t
  val readRatioAvg : (t, float) GapiLens.t
  val readRatioMax : (t, float) GapiLens.t
  val recordsRead : (t, int64) GapiLens.t
  val recordsWritten : (t, int64) GapiLens.t
  val steps : (t, ExplainQueryStep.t list) GapiLens.t
  val waitRatioAvg : (t, float) GapiLens.t
  val waitRatioMax : (t, float) GapiLens.t
  val writeRatioAvg : (t, float) GapiLens.t
  val writeRatioMax : (t, float) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobStatistics2 :
sig
  type t = {
    billingTier : int;
    (** \[Output-only\] Billing tier for the job. *)
    cacheHit : bool;
    (** \[Output-only\] Whether the query result was fetched from the query cache. *)
    queryPlan : ExplainQueryStage.t list;
    (** \[Output-only, Experimental\] Describes execution plan for the query as a list of stages. *)
    totalBytesBilled : int64;
    (** \[Output-only\] Total bytes billed for the job. *)
    totalBytesProcessed : int64;
    (** \[Output-only\] Total bytes processed for the job. *)
    
  }
  
  val billingTier : (t, int) GapiLens.t
  val cacheHit : (t, bool) GapiLens.t
  val queryPlan : (t, ExplainQueryStage.t list) GapiLens.t
  val totalBytesBilled : (t, int64) GapiLens.t
  val totalBytesProcessed : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobStatistics :
sig
  type t = {
    creationTime : int64;
    (** \[Output-only\] Creation time of this job, in milliseconds since the epoch. This field will be present on all jobs. *)
    endTime : int64;
    (** \[Output-only\] End time of this job, in milliseconds since the epoch. This field will be present whenever a job is in the DONE state. *)
    extract : JobStatistics4.t;
    (** \[Output-only\] Statistics for an extract job. *)
    load : JobStatistics3.t;
    (** \[Output-only\] Statistics for a load job. *)
    query : JobStatistics2.t;
    (** \[Output-only\] Statistics for a query job. *)
    startTime : int64;
    (** \[Output-only\] Start time of this job, in milliseconds since the epoch. This field will be present when the job transitions from the PENDING state to either RUNNING or DONE. *)
    totalBytesProcessed : int64;
    (** \[Output-only\] \[Deprecated\] Use the bytes processed in the query statistics instead. *)
    
  }
  
  val creationTime : (t, int64) GapiLens.t
  val endTime : (t, int64) GapiLens.t
  val extract : (t, JobStatistics4.t) GapiLens.t
  val load : (t, JobStatistics3.t) GapiLens.t
  val query : (t, JobStatistics2.t) GapiLens.t
  val startTime : (t, int64) GapiLens.t
  val totalBytesProcessed : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProjectReference :
sig
  type t = {
    projectId : string;
    (** \[Required\] ID of the project. Can be either the numeric ID or the assigned ID of the project. *)
    
  }
  
  val projectId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobConfigurationExtract :
sig
  type t = {
    compression : string;
    (** \[Optional\] The compression type to use for exported files. Possible values include GZIP and NONE. The default value is NONE. *)
    destinationFormat : string;
    (** \[Optional\] The exported file format. Possible values include CSV, NEWLINE_DELIMITED_JSON and AVRO. The default value is CSV. Tables with nested or repeated fields cannot be exported as CSV. *)
    destinationUri : string;
    (** \[Pick one\] DEPRECATED: Use destinationUris instead, passing only one URI as necessary. The fully-qualified Google Cloud Storage URI where the extracted table should be written. *)
    destinationUris : string list;
    (** \[Pick one\] A list of fully-qualified Google Cloud Storage URIs where the extracted table should be written. *)
    fieldDelimiter : string;
    (** \[Optional\] Delimiter to use between fields in the exported data. Default is ',' *)
    printHeader : bool;
    (** \[Optional\] Whether to print out a header row in the results. Default is true. *)
    sourceTable : TableReference.t;
    (** \[Required\] A reference to the table being exported. *)
    
  }
  
  val compression : (t, string) GapiLens.t
  val destinationFormat : (t, string) GapiLens.t
  val destinationUri : (t, string) GapiLens.t
  val destinationUris : (t, string list) GapiLens.t
  val fieldDelimiter : (t, string) GapiLens.t
  val printHeader : (t, bool) GapiLens.t
  val sourceTable : (t, TableReference.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableCell :
sig
  type t = {
    v : string;
    (**  *)
    
  }
  
  val v : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableRow :
sig
  type t = {
    f : TableCell.t list;
    (** Represents a single row in the result set, consisting of one or more fields. *)
    
  }
  
  val f : (t, TableCell.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableDataList :
sig
  type t = {
    etag : string;
    (** A hash of this page of results. *)
    kind : string;
    (** The resource type of the response. *)
    pageToken : string;
    (** A token used for paging results. Providing this token instead of the startIndex parameter can help you retrieve stable results when an underlying table is changing. *)
    rows : TableRow.t list;
    (** Rows of results. *)
    totalRows : int64;
    (** The total number of rows in the complete table. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val pageToken : (t, string) GapiLens.t
  val rows : (t, TableRow.t list) GapiLens.t
  val totalRows : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobReference :
sig
  type t = {
    jobId : string;
    (** \[Required\] The ID of the job. The ID must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). The maximum length is 1,024 characters. *)
    projectId : string;
    (** \[Required\] The ID of the project containing this job. *)
    
  }
  
  val jobId : (t, string) GapiLens.t
  val projectId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module QueryResponse :
sig
  type t = {
    cacheHit : bool;
    (** Whether the query result was fetched from the query cache. *)
    errors : ErrorProto.t list;
    (** \[Output-only\] All errors and warnings encountered during the running of the job. Errors here do not necessarily mean that the job has completed or was unsuccessful. *)
    jobComplete : bool;
    (** Whether the query has completed or not. If rows or totalRows are present, this will always be true. If this is false, totalRows will not be available. *)
    jobReference : JobReference.t;
    (** Reference to the Job that was created to run the query. This field will be present even if the original request timed out, in which case GetQueryResults can be used to read the results once the query has completed. Since this API only returns the first page of results, subsequent pages can be fetched via the same mechanism (GetQueryResults). *)
    kind : string;
    (** The resource type. *)
    pageToken : string;
    (** A token used for paging results. *)
    rows : TableRow.t list;
    (** An object with as many results as can be contained within the maximum permitted reply size. To get any additional rows, you can call GetQueryResults and specify the jobReference returned above. *)
    schema : TableSchema.t;
    (** The schema of the results. Present only when the query completes successfully. *)
    totalBytesProcessed : int64;
    (** The total number of bytes processed for this query. If this query was a dry run, this is the number of bytes that would be processed if the query were run. *)
    totalRows : string;
    (** The total number of rows in the complete query result set, which can be more than the number of rows in this single page of results. *)
    
  }
  
  val cacheHit : (t, bool) GapiLens.t
  val errors : (t, ErrorProto.t list) GapiLens.t
  val jobComplete : (t, bool) GapiLens.t
  val jobReference : (t, JobReference.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val pageToken : (t, string) GapiLens.t
  val rows : (t, TableRow.t list) GapiLens.t
  val schema : (t, TableSchema.t) GapiLens.t
  val totalBytesProcessed : (t, int64) GapiLens.t
  val totalRows : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableList :
sig
  module Tables :
  sig
    type t = {
      friendlyName : string;
      (** The user-friendly name for this table. *)
      id : string;
      (** An opaque ID of the table *)
      kind : string;
      (** The resource type. *)
      tableReference : TableReference.t;
      (** A reference uniquely identifying the table. *)
      _type : string;
      (** The type of table. Possible values are: TABLE, VIEW. *)
      
    }
    
    val friendlyName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val kind : (t, string) GapiLens.t
    val tableReference : (t, TableReference.t) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    etag : string;
    (** A hash of this page of results. *)
    kind : string;
    (** The type of list. *)
    nextPageToken : string;
    (** A token to request the next page of results. *)
    tables : Tables.t list;
    (** Tables in the requested dataset. *)
    totalItems : int;
    (** The total number of tables in the dataset. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val tables : (t, Tables.t list) GapiLens.t
  val totalItems : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GetQueryResultsResponse :
sig
  type t = {
    cacheHit : bool;
    (** Whether the query result was fetched from the query cache. *)
    errors : ErrorProto.t list;
    (** \[Output-only\] All errors and warnings encountered during the running of the job. Errors here do not necessarily mean that the job has completed or was unsuccessful. *)
    etag : string;
    (** A hash of this response. *)
    jobComplete : bool;
    (** Whether the query has completed or not. If rows or totalRows are present, this will always be true. If this is false, totalRows will not be available. *)
    jobReference : JobReference.t;
    (** Reference to the BigQuery Job that was created to run the query. This field will be present even if the original request timed out, in which case GetQueryResults can be used to read the results once the query has completed. Since this API only returns the first page of results, subsequent pages can be fetched via the same mechanism (GetQueryResults). *)
    kind : string;
    (** The resource type of the response. *)
    pageToken : string;
    (** A token used for paging results. *)
    rows : TableRow.t list;
    (** An object with as many results as can be contained within the maximum permitted reply size. To get any additional rows, you can call GetQueryResults and specify the jobReference returned above. Present only when the query completes successfully. *)
    schema : TableSchema.t;
    (** The schema of the results. Present only when the query completes successfully. *)
    totalBytesProcessed : int64;
    (** The total number of bytes processed for this query. *)
    totalRows : string;
    (** The total number of rows in the complete query result set, which can be more than the number of rows in this single page of results. Present only when the query completes successfully. *)
    
  }
  
  val cacheHit : (t, bool) GapiLens.t
  val errors : (t, ErrorProto.t list) GapiLens.t
  val etag : (t, string) GapiLens.t
  val jobComplete : (t, bool) GapiLens.t
  val jobReference : (t, JobReference.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val pageToken : (t, string) GapiLens.t
  val rows : (t, TableRow.t list) GapiLens.t
  val schema : (t, TableSchema.t) GapiLens.t
  val totalBytesProcessed : (t, int64) GapiLens.t
  val totalRows : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobConfigurationLink :
sig
  type t = {
    createDisposition : string;
    (** \[Optional\] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    destinationTable : TableReference.t;
    (** \[Required\] The destination table of the link job. *)
    sourceUri : string list;
    (** \[Required\] URI of source table to link. *)
    writeDisposition : string;
    (** \[Optional\] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_EMPTY. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    
  }
  
  val createDisposition : (t, string) GapiLens.t
  val destinationTable : (t, TableReference.t) GapiLens.t
  val sourceUri : (t, string list) GapiLens.t
  val writeDisposition : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JsonValue : module type of String

module JsonObject : module type of GapiJson.StringDictionary

module JobConfigurationLoad :
sig
  type t = {
    allowJaggedRows : bool;
    (** \[Optional\] Accept rows that are missing trailing optional columns. The missing values are treated as nulls. If false, records with missing trailing columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. Only applicable to CSV, ignored for other formats. *)
    allowQuotedNewlines : bool;
    (** Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file. The default value is false. *)
    createDisposition : string;
    (** \[Optional\] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    destinationTable : TableReference.t;
    (** \[Required\] The destination table to load the data into. *)
    encoding : string;
    (** \[Optional\] The character encoding of the data. The supported values are UTF-8 or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the raw, binary data has been split using the values of the quote and fieldDelimiter properties. *)
    fieldDelimiter : string;
    (** \[Optional\] The separator for fields in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. BigQuery also supports the escape sequence "\t" to specify a tab separator. The default value is a comma (','). *)
    ignoreUnknownValues : bool;
    (** \[Optional\] Indicates if BigQuery should allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. The sourceFormat property determines what BigQuery treats as an extra value: CSV: Trailing columns JSON: Named values that don't match any column names *)
    maxBadRecords : int;
    (** \[Optional\] The maximum number of bad records that BigQuery can ignore when running the job. If the number of bad records exceeds this value, an invalid error is returned in the job result. The default value is 0, which requires that all records are valid. *)
    projectionFields : string list;
    (** \[Experimental\] If sourceFormat is set to "DATASTORE_BACKUP", indicates which entity properties to load into BigQuery from a Cloud Datastore backup. Property names are case sensitive and must be top-level properties. If no properties are specified, BigQuery loads all properties. If any named property isn't found in the Cloud Datastore backup, an invalid error is returned in the job result. *)
    quote : string;
    (** \[Optional\] The value that is used to quote data sections in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. The default value is a double-quote ('"'). If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the allowQuotedNewlines property to true. *)
    schema : TableSchema.t;
    (** \[Optional\] The schema for the destination table. The schema can be omitted if the destination table already exists or if the schema can be inferred from the loaded data. *)
    schemaInline : string;
    (** \[Deprecated\] The inline schema. For CSV schemas, specify as "Field1:Type1\[,Field2:Type2\]*". For example, "foo:STRING, bar:INTEGER, baz:FLOAT". *)
    schemaInlineFormat : string;
    (** \[Deprecated\] The format of the schemaInline property. *)
    skipLeadingRows : int;
    (** \[Optional\] The number of rows at the top of a CSV file that BigQuery will skip when loading the data. The default value is 0. This property is useful if you have header rows in the file that should be skipped. *)
    sourceFormat : string;
    (** \[Optional\] The format of the data files. For CSV files, specify "CSV". For datastore backups, specify "DATASTORE_BACKUP". For newline-delimited JSON, specify "NEWLINE_DELIMITED_JSON". The default value is CSV. *)
    sourceUris : string list;
    (** \[Required\] The fully-qualified URIs that point to your data in Google Cloud Storage. Each URI can contain one '*' wildcard character and it must come after the 'bucket' name. *)
    writeDisposition : string;
    (** \[Optional\] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_APPEND. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    
  }
  
  val allowJaggedRows : (t, bool) GapiLens.t
  val allowQuotedNewlines : (t, bool) GapiLens.t
  val createDisposition : (t, string) GapiLens.t
  val destinationTable : (t, TableReference.t) GapiLens.t
  val encoding : (t, string) GapiLens.t
  val fieldDelimiter : (t, string) GapiLens.t
  val ignoreUnknownValues : (t, bool) GapiLens.t
  val maxBadRecords : (t, int) GapiLens.t
  val projectionFields : (t, string list) GapiLens.t
  val quote : (t, string) GapiLens.t
  val schema : (t, TableSchema.t) GapiLens.t
  val schemaInline : (t, string) GapiLens.t
  val schemaInlineFormat : (t, string) GapiLens.t
  val skipLeadingRows : (t, int) GapiLens.t
  val sourceFormat : (t, string) GapiLens.t
  val sourceUris : (t, string list) GapiLens.t
  val writeDisposition : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobConfigurationTableCopy :
sig
  type t = {
    createDisposition : string;
    (** \[Optional\] Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. The default value is CREATE_IF_NEEDED. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    destinationTable : TableReference.t;
    (** \[Required\] The destination table *)
    sourceTable : TableReference.t;
    (** \[Pick one\] Source table to copy. *)
    sourceTables : TableReference.t list;
    (** \[Pick one\] Source tables to copy. *)
    writeDisposition : string;
    (** \[Optional\] Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. The default value is WRITE_EMPTY. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. *)
    
  }
  
  val createDisposition : (t, string) GapiLens.t
  val destinationTable : (t, TableReference.t) GapiLens.t
  val sourceTable : (t, TableReference.t) GapiLens.t
  val sourceTables : (t, TableReference.t list) GapiLens.t
  val writeDisposition : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobConfiguration :
sig
  type t = {
    copy : JobConfigurationTableCopy.t;
    (** \[Pick one\] Copies a table. *)
    dryRun : bool;
    (** \[Optional\] If set, don't actually run this job. A valid query will return a mostly empty response with some processing statistics, while an invalid query will return the same error it would if it wasn't a dry run. Behavior of non-query jobs is undefined. *)
    extract : JobConfigurationExtract.t;
    (** \[Pick one\] Configures an extract job. *)
    link : JobConfigurationLink.t;
    (** \[Pick one\] Configures a link job. *)
    load : JobConfigurationLoad.t;
    (** \[Pick one\] Configures a load job. *)
    query : JobConfigurationQuery.t;
    (** \[Pick one\] Configures a query job. *)
    
  }
  
  val copy : (t, JobConfigurationTableCopy.t) GapiLens.t
  val dryRun : (t, bool) GapiLens.t
  val extract : (t, JobConfigurationExtract.t) GapiLens.t
  val link : (t, JobConfigurationLink.t) GapiLens.t
  val load : (t, JobConfigurationLoad.t) GapiLens.t
  val query : (t, JobConfigurationQuery.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobList :
sig
  module Jobs :
  sig
    type t = {
      configuration : JobConfiguration.t;
      (** \[Full-projection-only\] Specifies the job configuration. *)
      errorResult : ErrorProto.t;
      (** A result object that will be present only if the job has failed. *)
      id : string;
      (** Unique opaque ID of the job. *)
      jobReference : JobReference.t;
      (** Job reference uniquely identifying the job. *)
      kind : string;
      (** The resource type. *)
      state : string;
      (** Running state of the job. When the state is DONE, errorResult can be checked to determine whether the job succeeded or failed. *)
      statistics : JobStatistics.t;
      (** \[Output-only\] Information about the job, including starting time and ending time of the job. *)
      status : JobStatus.t;
      (** \[Full-projection-only\] Describes the state of the job. *)
      user_email : string;
      (** \[Full-projection-only\] Email address of the user who ran the job. *)
      
    }
    
    val configuration : (t, JobConfiguration.t) GapiLens.t
    val errorResult : (t, ErrorProto.t) GapiLens.t
    val id : (t, string) GapiLens.t
    val jobReference : (t, JobReference.t) GapiLens.t
    val kind : (t, string) GapiLens.t
    val state : (t, string) GapiLens.t
    val statistics : (t, JobStatistics.t) GapiLens.t
    val status : (t, JobStatus.t) GapiLens.t
    val user_email : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    etag : string;
    (** A hash of this page of results. *)
    jobs : Jobs.t list;
    (** List of jobs that were requested. *)
    kind : string;
    (** The resource type of the response. *)
    nextPageToken : string;
    (** A token to request the next page of results. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val jobs : (t, Jobs.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProjectList :
sig
  module Projects :
  sig
    type t = {
      friendlyName : string;
      (** A descriptive name for this project. *)
      id : string;
      (** An opaque ID of this project. *)
      kind : string;
      (** The resource type. *)
      numericId : string;
      (** The numeric ID of this project. *)
      projectReference : ProjectReference.t;
      (** A unique reference to this project. *)
      
    }
    
    val friendlyName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val kind : (t, string) GapiLens.t
    val numericId : (t, string) GapiLens.t
    val projectReference : (t, ProjectReference.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    etag : string;
    (** A hash of the page of results *)
    kind : string;
    (** The type of list. *)
    nextPageToken : string;
    (** A token to request the next page of results. *)
    projects : Projects.t list;
    (** Projects to which you have at least READ access. *)
    totalItems : int;
    (** The total number of projects in the list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val projects : (t, Projects.t list) GapiLens.t
  val totalItems : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Dataset :
sig
  module Access :
  sig
    type t = {
      domain : string;
      (** \[Pick one\] A domain to grant access to. Any users signed in with the domain specified will be granted the specified access. Example: "example.com". *)
      groupByEmail : string;
      (** \[Pick one\] An email address of a Google Group to grant access to. *)
      role : string;
      (** \[Required\] Describes the rights granted to the user specified by the other member of the access object. The following string values are supported: READER, WRITER, OWNER. *)
      specialGroup : string;
      (** \[Pick one\] A special group to grant access to. Possible values include: projectOwners: Owners of the enclosing project. projectReaders: Readers of the enclosing project. projectWriters: Writers of the enclosing project. allAuthenticatedUsers: All authenticated BigQuery users. *)
      userByEmail : string;
      (** \[Pick one\] An email address of a user to grant access to. For example: fred\@example.com. *)
      view : TableReference.t;
      (** \[Pick one\] A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation. *)
      
    }
    
    val domain : (t, string) GapiLens.t
    val groupByEmail : (t, string) GapiLens.t
    val role : (t, string) GapiLens.t
    val specialGroup : (t, string) GapiLens.t
    val userByEmail : (t, string) GapiLens.t
    val view : (t, TableReference.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    access : Access.t list;
    (** \[Optional\] An array of objects that define dataset access for one or more entities. You can set this property when inserting or updating a dataset in order to control who is allowed to access the data. If unspecified at dataset creation time, BigQuery adds default dataset access for the following entities: access.specialGroup: projectReaders; access.role: READER; access.specialGroup: projectWriters; access.role: WRITER; access.specialGroup: projectOwners; access.role: OWNER; access.userByEmail: \[dataset creator email\]; access.role: OWNER; *)
    creationTime : int64;
    (** \[Output-only\] The time when this dataset was created, in milliseconds since the epoch. *)
    datasetReference : DatasetReference.t;
    (** \[Required\] A reference that identifies the dataset. *)
    defaultTableExpirationMs : int64;
    (** \[Experimental\] The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). Once this property is set, all newly-created tables in the dataset will have an expirationTime property set to the creation time plus the value in this property, and changing the value will only affect new tables, not existing ones. When the expirationTime for a given table is reached, that table will be deleted automatically. If a table's expirationTime is modified or removed before the table expires, or if you provide an explicit expirationTime when creating a table, that value takes precedence over the default expiration time indicated by this property. *)
    description : string;
    (** \[Optional\] A user-friendly description of the dataset. *)
    etag : string;
    (** \[Output-only\] A hash of the resource. *)
    friendlyName : string;
    (** \[Optional\] A descriptive name for the dataset. *)
    id : string;
    (** \[Output-only\] The fully-qualified unique name of the dataset in the format projectId:datasetId. The dataset name without the project name is given in the datasetId field. When creating a new dataset, leave this field blank, and instead specify the datasetId field. *)
    kind : string;
    (** \[Output-only\] The resource type. *)
    lastModifiedTime : int64;
    (** \[Output-only\] The date when this dataset or any of its tables was last modified, in milliseconds since the epoch. *)
    location : string;
    (** \[Experimental\] The geographic location where the dataset should reside. Possible values include EU and US. The default value is US. *)
    selfLink : string;
    (** \[Output-only\] A URL that can be used to access the resource again. You can use this URL in Get or Update requests to the resource. *)
    
  }
  
  val access : (t, Access.t list) GapiLens.t
  val creationTime : (t, int64) GapiLens.t
  val datasetReference : (t, DatasetReference.t) GapiLens.t
  val defaultTableExpirationMs : (t, int64) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val friendlyName : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lastModifiedTime : (t, int64) GapiLens.t
  val location : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Streamingbuffer :
sig
  type t = {
    estimatedBytes : string;
    (** \[Output-only\] A lower-bound estimate of the number of bytes currently in the streaming buffer. *)
    estimatedRows : string;
    (** \[Output-only\] A lower-bound estimate of the number of rows currently in the streaming buffer. *)
    oldestEntryTime : string;
    (** \[Output-only\] Contains the timestamp of the oldest entry in the streaming buffer, in milliseconds since the epoch, if the streaming buffer is available. *)
    
  }
  
  val estimatedBytes : (t, string) GapiLens.t
  val estimatedRows : (t, string) GapiLens.t
  val oldestEntryTime : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ViewDefinition :
sig
  type t = {
    query : string;
    (** \[Required\] A query that BigQuery executes when the view is referenced. *)
    userDefinedFunctionResources : UserDefinedFunctionResource.t list;
    (** \[Experimental\] Describes user-defined function resources used in the query. *)
    
  }
  
  val query : (t, string) GapiLens.t
  val userDefinedFunctionResources : (t, UserDefinedFunctionResource.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Table :
sig
  type t = {
    creationTime : int64;
    (** \[Output-only\] The time when this table was created, in milliseconds since the epoch. *)
    description : string;
    (** \[Optional\] A user-friendly description of this table. *)
    etag : string;
    (** \[Output-only\] A hash of this resource. *)
    expirationTime : int64;
    (** \[Optional\] The time when this table expires, in milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed. *)
    externalDataConfiguration : ExternalDataConfiguration.t;
    (** \[Experimental\] Describes the data format, location, and other properties of a table stored outside of BigQuery. By defining these properties, the data source can then be queried as if it were a standard BigQuery table. *)
    friendlyName : string;
    (** \[Optional\] A descriptive name for this table. *)
    id : string;
    (** \[Output-only\] An opaque ID uniquely identifying the table. *)
    kind : string;
    (** \[Output-only\] The type of the resource. *)
    lastModifiedTime : string;
    (** \[Output-only\] The time when this table was last modified, in milliseconds since the epoch. *)
    location : string;
    (** \[Output-only\] The geographic location where the table resides. This value is inherited from the dataset. *)
    numBytes : int64;
    (** \[Output-only\] The size of this table in bytes, excluding any data in the streaming buffer. *)
    numRows : string;
    (** \[Output-only\] The number of rows of data in this table, excluding any data in the streaming buffer. *)
    schema : TableSchema.t;
    (** \[Optional\] Describes the schema of this table. *)
    selfLink : string;
    (** \[Output-only\] A URL that can be used to access this resource again. *)
    streamingBuffer : Streamingbuffer.t;
    (** \[Output-only\] Contains information regarding this table's streaming buffer, if one is present. This field will be absent if the table is not being streamed to or if there is no data in the streaming buffer. *)
    tableReference : TableReference.t;
    (** \[Required\] Reference describing the ID of this table. *)
    _type : string;
    (** \[Output-only\] Describes the table type. The following values are supported: TABLE: A normal BigQuery table. VIEW: A virtual table defined by a SQL query. The default value is TABLE. *)
    view : ViewDefinition.t;
    (** \[Optional\] The view definition. *)
    
  }
  
  val creationTime : (t, int64) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val expirationTime : (t, int64) GapiLens.t
  val externalDataConfiguration : (t, ExternalDataConfiguration.t) GapiLens.t
  val friendlyName : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lastModifiedTime : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val numBytes : (t, int64) GapiLens.t
  val numRows : (t, string) GapiLens.t
  val schema : (t, TableSchema.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val streamingBuffer : (t, Streamingbuffer.t) GapiLens.t
  val tableReference : (t, TableReference.t) GapiLens.t
  val _type : (t, string) GapiLens.t
  val view : (t, ViewDefinition.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableDataInsertAllResponse :
sig
  module InsertErrors :
  sig
    type t = {
      errors : ErrorProto.t list;
      (** Error information for the row indicated by the index property. *)
      index : int;
      (** The index of the row that error applies to. *)
      
    }
    
    val errors : (t, ErrorProto.t list) GapiLens.t
    val index : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    insertErrors : InsertErrors.t list;
    (** An array of errors for rows that were not inserted. *)
    kind : string;
    (** The resource type of the response. *)
    
  }
  
  val insertErrors : (t, InsertErrors.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Job :
sig
  type t = {
    configuration : JobConfiguration.t;
    (** \[Required\] Describes the job configuration. *)
    etag : string;
    (** \[Output-only\] A hash of this resource. *)
    id : string;
    (** \[Output-only\] Opaque ID field of the job *)
    jobReference : JobReference.t;
    (** \[Optional\] Reference describing the unique-per-user name of the job. *)
    kind : string;
    (** \[Output-only\] The type of the resource. *)
    selfLink : string;
    (** \[Output-only\] A URL that can be used to access this resource again. *)
    statistics : JobStatistics.t;
    (** \[Output-only\] Information about the job, including starting time and ending time of the job. *)
    status : JobStatus.t;
    (** \[Output-only\] The status of this job. Examine this value when polling an asynchronous job to see if the job is complete. *)
    user_email : string;
    (** \[Output-only\] Email address of the user who ran the job. *)
    
  }
  
  val configuration : (t, JobConfiguration.t) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val jobReference : (t, JobReference.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val statistics : (t, JobStatistics.t) GapiLens.t
  val status : (t, JobStatus.t) GapiLens.t
  val user_email : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module JobCancelResponse :
sig
  type t = {
    job : Job.t;
    (** The final state of the job. *)
    kind : string;
    (** The resource type of the response. *)
    
  }
  
  val job : (t, Job.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DatasetList :
sig
  module Datasets :
  sig
    type t = {
      datasetReference : DatasetReference.t;
      (** The dataset reference. Use this property to access specific parts of the dataset's ID, such as project ID or dataset ID. *)
      friendlyName : string;
      (** A descriptive name for the dataset, if one exists. *)
      id : string;
      (** The fully-qualified, unique, opaque ID of the dataset. *)
      kind : string;
      (** The resource type. This property always returns the value "bigquery#dataset". *)
      
    }
    
    val datasetReference : (t, DatasetReference.t) GapiLens.t
    val friendlyName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val kind : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    datasets : Datasets.t list;
    (** An array of the dataset resources in the project. Each resource contains basic information. For full information about a particular dataset resource, use the Datasets: get method. This property is omitted when there are no datasets in the project. *)
    etag : string;
    (** A hash value of the results page. You can use this property to determine if the page has changed since the last request. *)
    kind : string;
    (** The list type. This property always returns the value "bigquery#datasetList". *)
    nextPageToken : string;
    (** A token that can be used to request the next results page. This property is omitted on the final results page. *)
    
  }
  
  val datasets : (t, Datasets.t list) GapiLens.t
  val etag : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module QueryRequest :
sig
  type t = {
    defaultDataset : DatasetReference.t;
    (** \[Optional\] Specifies the default datasetId and projectId to assume for any unqualified table names in the query. If not set, all table names in the query string must be qualified in the format 'datasetId.tableId'. *)
    dryRun : bool;
    (** \[Optional\] If set to true, BigQuery doesn't run the job. Instead, if the query is valid, BigQuery returns statistics about the job such as how many bytes would be processed. If the query is invalid, an error returns. The default value is false. *)
    kind : string;
    (** The resource type of the request. *)
    maxResults : int;
    (** \[Optional\] The maximum number of rows of data to return per page of results. Setting this flag to a small value such as 1000 and then paging through results might improve reliability when the query result set is large. In addition to this limit, responses are also limited to 10 MB. By default, there is no maximum row count, and only the byte limit applies. *)
    preserveNulls : bool;
    (** \[Deprecated\] This property is deprecated. *)
    query : string;
    (** \[Required\] A query string, following the BigQuery query syntax, of the query to execute. Example: "SELECT count(f1) FROM \[myProjectId:myDatasetId.myTableId\]". *)
    timeoutMs : int;
    (** \[Optional\] How long to wait for the query to complete, in milliseconds, before the request times out and returns. Note that this is only a timeout for the request, not the query. If the query takes longer to run than the timeout value, the call returns without any results and with the 'jobComplete' flag set to false. You can call GetQueryResults() to wait for the query to complete and read the results. The default value is 10000 milliseconds (10 seconds). *)
    useQueryCache : bool;
    (** \[Optional\] Whether to look for the result in the query cache. The query cache is a best-effort cache that will be flushed whenever tables in the query are modified. The default value is true. *)
    
  }
  
  val defaultDataset : (t, DatasetReference.t) GapiLens.t
  val dryRun : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val maxResults : (t, int) GapiLens.t
  val preserveNulls : (t, bool) GapiLens.t
  val query : (t, string) GapiLens.t
  val timeoutMs : (t, int) GapiLens.t
  val useQueryCache : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TableDataInsertAllRequest :
sig
  module Rows :
  sig
    type t = {
      insertId : string;
      (** \[Optional\] A unique ID for each row. BigQuery uses this property to detect duplicate insertion requests on a best-effort basis. *)
      json : JsonObject.t;
      (** \[Required\] A JSON object that contains a row of data. The object's properties and values must match the destination table's schema. *)
      
    }
    
    val insertId : (t, string) GapiLens.t
    val json : (t, JsonObject.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    ignoreUnknownValues : bool;
    (** \[Optional\] Accept rows that contain values that do not match the schema. The unknown values are ignored. Default is false, which treats unknown values as errors. *)
    kind : string;
    (** The resource type of the response. *)
    rows : Rows.t list;
    (** The rows to insert. *)
    skipInvalidRows : bool;
    (** \[Optional\] Insert all valid rows of a request, even if invalid rows exist. The default value is false, which causes the entire request to fail if any invalid rows exist. *)
    templateSuffix : string;
    (** \[Experimental\] If specified, treats the destination table as a base template, and inserts the rows into an instance table named "". BigQuery will manage creation of the instance table, using the schema of the base template table. *)
    
  }
  
  val ignoreUnknownValues : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val rows : (t, Rows.t list) GapiLens.t
  val skipInvalidRows : (t, bool) GapiLens.t
  val templateSuffix : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

