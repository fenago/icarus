# Flask_APIFlask_API

This Python script is setting up a Flask web server that provides an interface to a document search engine. The search engine is presumably running on a different process or machine, and the Flask server communicates with it using Python's multiprocessing.managers.BaseManager for remote procedure calls. Here's a breakdown of what the script does:

- It imports necessary modules and sets up a Flask application with Cross-Origin Resource Sharing (CORS) enabled.

- It connects to the remote manager and registers three functions: `query_index`, `insert_into_index`, and `get_documents_list`.

- It defines a route `/query` that accepts GET requests. This route takes a text parameter from the query string, sends it to the remote `query_index` function, and returns the results as JSON.

- It defines a route `/uploadFile` that accepts POST requests with a file. This route saves the uploaded file to a temporary location, sends the file path to the remote `insert_into_index` function, and then deletes the temporary file. If there's a `filename_as_doc_id` field in the form data, it uses the filename as the document ID.

- It defines a route `/getDocuments` that accepts GET requests. This route calls the remote `get_documents_list` function and returns the results as JSON.

- It defines a default route `/` that returns a welcome message.

If the script is run directly (not imported as a module), it starts the Flask server on all network interfaces (0.0.0.0) and port 5601, with debug mode enabled.

In summary, this script is creating an API interface for a document search engine. Users can upload files to be indexed, query the index, and retrieve a list of all indexed documents. The actual indexing and querying are done by a separate process or machine, and the Flask server just acts as a middleman.
