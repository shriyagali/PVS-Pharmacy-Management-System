<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>PVS IMS</title>
<link rel="stylesheet" href="homestyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
         <div class="smooth">
  <header>
    <h3>PVS</h3>
    <ul>
      <li><a href="#one">Home</a></li>
      <li><a href="#two">Our Team</a></li>
      
    </ul>
  </header>
  <section id="one">
    <div class="content parallax">
        <div>
          <!--/*game.style.width = width + 'px'game.style.height = height + 'pxhero.style.top = height - 80 + 'px'hero.style.left = halfWidth - ASSETS.IMAGE.HERO.width / 2 + 'px'hero.style.background = `url(${ASSETS.IMAGE.HERO.src})`hero.style.width = `${ASSETS.IMAGE.HERO.width}px`hero.style.height = `${ASSETS.IMAGE.HERO.height}px`*/-->

        <h1>PVS Pharmacy</h1>
        <svg class="title">
          <text x="0" y="40">PVS Pharmacy</text>
          <path d="M 0 66 50 61"></path>
        </svg>
        <p class="lead">
         Your go-to pharmacy, run by your trusted neighbours. Established in 1985, bring the best of services to your door step.
            We are now open in 5 location in the Chicago Surburbia - Wheaton, Lombard, Bloomington, Bartlett, Riverforest.
            Register with us, and we will take care of your refills and prescriptions. We also provide door delivery, curb side pick up and lockbox facility.
        </p>
         <!--
         /*game.style.width = width + 'px'game.style.height = height + 'pxhero.style.top = height - 80 + 'px'hero.style.left = halfWidth - ASSETS.IMAGE.HERO.width / 2 + 'px'hero.style.background = `url(${ASSETS.IMAGE.HERO.src})`hero.style.width = `${ASSETS.IMAGE.HERO.width}px`hero.style.height = `${ASSETS.IMAGE.HERO.height}px`*/

      -->
        
      </div>
      <div class="blur">
      	
        <form action="<%=request.getContextPath()%>/LoginServlet" method = "post">
        
        <p> Login </p>
          <input placeholder="Email:"
          type="email"
          name="Email"
          />
          <input placeholder="Password"
          type="password"
          name="Password"
          />
          <select name="Role" id="role-select">
    		<option value="">--Please choose a Role--</option>
    		<option value="manager">manager</option>
    		<option value="employee">employee</option>
    	</select>
    	
    		<span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
          <input type="submit" class="button" value="Login"/>
        </form>
      </div>
    </div>
  </section>
   <!--
          /*game.style.width = width + 'px'game.style.height = height + 'pxhero.style.top = height - 80 + 'px'hero.style.left = halfWidth - ASSETS.IMAGE.HERO.width / 2 + 'px'hero.style.background = `url(${ASSETS.IMAGE.HERO.src})`hero.style.width = `${ASSETS.IMAGE.HERO.width}px`hero.style.height = `${ASSETS.IMAGE.HERO.height}px`*/

      -->
 <section id="two">
    <h2>Our<span> Team</span></h2>
    <p>We a group of Dynamic Individuals with passion to build and create.....</p>
    <div class="blocks">
       <div class="block">
       <div class="polaroid"><img src="Char.jpg" alt="5 Terre" style="width:100%">
  		<div class="container">
  			<p style = "text-align:center">Charolette Chen</span><p style = "text-align:center"><a href="https://www.linkedin.com/in/zhiqi-charlotte-chen-697a8b146/" target="_blank"><i class="fa fa-linkedin-square" style="font-size:24px;color:#0e76a8"></i></a></p>
               <p style = "text-align:center">Database Administrator</p>
               <p style = "text-align:center">A recent graduate in Information Systems with expertise in database administration.</p>
               <p style = "text-align:center"><a href="mailto:char@pvs.com"><button class="button">Contact</button></a></p>
  		</div>
		</div></div>
		
      <div class="block">
        <div class="polaroid">
  		<img src="Chirag.jpeg" alt="5 Terre" style="width:100%">
  		<div class="container">
  			<p style = "text-align:center">Chirag Ahluwalia</span><p style = "text-align:center"><a href="https://www.linkedin.com/in/ahluwaliachirag/" target="_blank"><i class="fa fa-linkedin-square" style="font-size:24px;color:#0e76a8"></i></a></p>
               <p style = "text-align:center">Data Scientist</p>
               <p style = "text-align:center">Data Scientist with extensive experience in delivering proven results through management of technical operations and projects, within time and budget constraints</p>
               <p style = "text-align:center"><a href="mailto:char@pvs.com"><button class="button">Contact</button></a></p>
  		</div>
      </div></div>
      
      <div class="block">
        <div class="polaroid">
  		<img src="picture.jpg" alt="5 Terre" style="width:100%">
  		<div class="container">
  			<p style = "text-align:center">Shriya Gali</span><p style = "text-align:center"><a href="https://www.linkedin.com/in/shriyagali" target="_blank"><i class="fa fa-linkedin-square" style="font-size:24px;color:#0e76a8"></i></a></p>
               <p style = "text-align:center">Tech Lead</p>
               <p style = "text-align:center">Passionate about developing cutting edge technologies. Experienced data analytics professional.</p>
               <p style = "text-align:center"><a href="mailto:char@pvs.com"><button class="button">Contact</button></a></p>
  		</div>
      </div>
      </div>
      <div class="block">
        <div class="polaroid">
  		<img src="Uma1.jpg" alt="5 Terre" style="width:100%">
  		<div class="container">
  			<p style = "text-align:center">Uma Chamarthy</span><p style = "text-align:center"><a href="https://www.linkedin.com/in/uma-c-a66b031a/" target="_blank"><i class="fa fa-linkedin-square" style="font-size:24px;color:#0e76a8"></i></a></p>
               <p style = "text-align:center">Design Lead</p>
               <p style = "text-align:center">An accomplished business manager with vast experience in the product design & development, business analysis, development and marketing.</p>
               <p style = "text-align:center"><a href="mailto:char@pvs.com"><button class="button">Contact</button></a></p>
  		</div>
      	</div>
    	</div>
    	</div>
     <!--
          /*game.style.width = width + 'px'game.style.height = height + 'pxhero.style.top = height - 80 + 'px'hero.style.left = halfWidth - ASSETS.IMAGE.HERO.width / 2 + 'px'hero.style.background = `url(${ASSETS.IMAGE.HERO.src})`hero.style.width = `${ASSETS.IMAGE.HERO.width}px`hero.style.height = `${ASSETS.IMAGE.HERO.height}px`*/

      -->
      
 </section>
  
  <footer>
    <div class="copy">
      <a href="#one">Scroll top &#x2191;</a>
    </div>
  </footer>
</div>
      <script>
      function scroller() {
    	  $(".smooth").on("scroll", function() {
    	    let scrollPos = $(this).scrollTop();
    	    $(".parallax").css({
    	      top: scrollPos / 2 + "px",
    	      opacity: 1 - scrollPos / 200
    	    });
    	  });
    	}
    	scroller();
    	/* When the user clicks on the button, 
    	toggle between hiding and showing the dropdown content */
    	
      </script>

</body>
</html>