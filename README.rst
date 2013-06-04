
ldpnotes
========
Linked Data Platform notes, ontologies, and resources.

Re: Proposal to close ISSUE-19: Adressing more error cases, as is
-------------------------------------------------------------------
Impetus
_________
* http://lists.w3.org/Archives/Public/public-ldp-wg/2013May/0234.html
* http://lists.w3.org/Archives/Public/public-ldp/2013Jun/thread.html#msg6
* **https://github.com/westurner/ldpnotes/blob/master/http-problem.ttl**


Interaction Sequence
_______________________

1. Client makes HTTP request
2. HTTP request is routed, balanced, and proxied
3. HTTP request received by application
4. Application routes URL to an application function
5. Application function executes logic across system
6. System presents complex errors and exceptions
7. Application catches errors and exceptions
8. Application returns HTTP Response with Status Code and Body
9. Client sees "fail whale", wants to know more
10. Devops and sysops point to CWE-200 and CWE-209 (... 200-215, 550)


Observations
______________

- At any step in the interaction, Errors or Exceptions may be encountered.
- Errors and Exceptions are propagated up the stack
- Exceptions should contain enough information to diagnose the problem
- Most Proxies, balancers, etc. understand HTTP (some HTML)
- Why would I need to look up the List of HTTP status codes?
- HTTP 2__ status codes are not errors or exceptions.
- What to do when status_code != 200 OK
- What to do when (status_code not in range(200,300))


Mapping to Existing Ontologies
________________________________
Mapping to schema.org
~~~~~~~~~~~~~~~~~~~~~~~

A ``WebApplication`` ``SoftwareApplication`` returns a ``WebPage``
(which could be a ``CollectionPage``, a ``SearchResultsPage``, a ``...``)
potentially containing *error message metadata*.

Beyond that, there is currently no notion of HTTP or an Error message in
schema.org. http://www.w3.org/wiki/WebSchemas/SchemaDotOrgProposals

    http://schema.org/Thing
    http://schema.org/CreativeWork
        http://schema.org/WebPage
        http://schema.org/CollectionPage
        http://schema.org/SearchResultsPage
    http://schema.org/SoftwareApplication
    http://schema.org/WebApplication



Mapping to HTTP-in-RDF
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

http://w3.org/TR/HTTP-in-RDF/

It would be convenient if ``http:httpStatusCode`` etc had an ``rdfs:domain``
of ``rdfs:Resource`` and/or ``prob:Problem`` and/or ``prob:ProblemType``
were just ``http:Responses``.


References
___________
- http://schema.rdfs.org/all.ttl (CCSA)
- https://tools.ietf.org/html/draft-nottingham-http-problem-04
- http://www.w3.org/TR/HTTP-in-RDF/
- http://www.w3.org/2011/http-statusCodes#
- http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
- https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
- http://answers.semanticweb.com/questions/2817/syntax-highlighting-for-turtle 
- http://stackoverflow.com/questions/3669407/convert-xsd-to-rdf-schema
