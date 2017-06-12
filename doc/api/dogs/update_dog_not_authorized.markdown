# Dogs API

also able to do via PUT

## Update dog not authorized

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
X-Request-Id: c77b5268-5e09-486d-9ec2-16a303c61671
X-Runtime: 0.005896
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
