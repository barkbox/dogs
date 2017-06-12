# Dogs API

## does not update dog not authorized

### PATCH /dogs/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| name |  name | false |  |
| size |  size | false |  |

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>PATCH /dogs/1</pre>

#### Body

<pre>name=Doge+Bryant&size=L</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 822b36cd-e6b6-4e67-927d-a7fee64a0dc2
X-Runtime: 0.008185
Content-Length: 60</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": [
    {
      "status": "422",
      "title": "not authorized error"
    }
  ]
}</pre>
