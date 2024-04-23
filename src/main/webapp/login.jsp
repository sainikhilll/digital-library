<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .container-fluid {
      background-image: url('libs.png'); 
      background-position: center;
      height: 95vh;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .login-container {
      background-color: rgba(255, 255, 255, 0.8);
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }

    .text-container {
      width: 40%;
      padding: 20px;
      text-align: center;
    }

    .login-form {
      width: 80%;
    }

    @media (max-width: 768px) {
      .text-container, .login-form {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 text-container fs-1 fw-bold text-black">
        <h1></h1>
      </div>
      <div class="col-md-6">

      </div>
      <div class="col-md-12 login-form">
        <div class="login-container">
          <h2 class="text-center mb-4">Welocme Back, Login</h2>
       <form action="patron" method="post">
            <div class="form-group">
              <label for="username">Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter username" required>
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <a href="register.jsp">Register?</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
