<!doctype html>
<html lang="en">
<head>
	<title>Omicron</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link rel=stylesheet href="srcs/css/base.css"/>
</head>
<body>

<script src="srcs/js/Three.js"></script>
<script src="srcs/js/Detector.js"></script>
<script src="srcs/js/Stats.js"></script>
<script src="srcs/js/OrbitControls.js"></script>
<script src="srcs/js/THREEx.KeyboardState.js"></script>
<script src="srcs/js/THREEx.FullScreen.js"></script>
<script src="srcs/js/THREEx.WindowResize.js"></script>
<script src="srcs/js/threex.domevents.js"></script>

<!-- jQuery code to display an information button and box when clicked. -->
<script src="srcs/js/jquery-1.11.2.min.js"></script>
<script src="srcs/js/jquery-ui.js"></script>
<link rel=stylesheet href="srcs/css/jquery-ui.css" />
<link rel=stylesheet href="srcs/css/info.css"/>
<script src="srcs/js/info.js"></script>

<!-- <div id="infoButton"></div> -->
<div id="infoBox" title="Datos">
	<p>Foto: <img src=""></p>
	<p>Nombre: </p>
	<p>Apellidos: </p>
	<p>Organización: </p>
	<p>Puesto: </p>
</div>

<!-- <div style='position: absolute; padding-left: 10px; font-size:200%;'>
	<strong>Eventos del mouse :</strong>
<div id='logs'></div>
</div> -->

<!-- <div id="ThreeJS" style="z-index: 1; position: absolute; left:0px; top:0px"></div> -->

<script>

	// standard global variables
	var container, scene, camera, renderer, controls;
	var keyboard = new THREEx.KeyboardState();
	var clock = new THREE.Clock();

	// custom global variables
	var sphere;
	var sub6;
        var sub7;
	var t=0;
	var t6=31;
        var t7=50;
        
	var flag = true;

	// initialization
	init();

	// animation loop / game loop
	animate();

	///////////////
	// FUNCTIONS //
	///////////////
		
function init() {
	///////////
	// SCENE //
	///////////
	scene = new THREE.Scene();

	////////////
	// CAMERA //
	////////////

	var SCREEN_WIDTH = window.innerWidth, SCREEN_HEIGHT = window.innerHeight;	
	// camera attributes
	var VIEW_ANGLE = 45, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 0.1, FAR = 20000;
	// set up camera
		camera = new THREE.PerspectiveCamera( VIEW_ANGLE, ASPECT, NEAR, FAR);
	// add the camera to the scene
		scene.add(camera);
		camera.position.set(0,0,100);
		camera.lookAt(scene.position);	
	
	//////////////
	// RENDERER //
	//////////////

	// create and start the renderer; choose antialias setting.
	if ( Detector.webgl )
		renderer = new THREE.WebGLRenderer( {antialias:true} );
	else
		renderer = new THREE.CanvasRenderer(); 

	renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
	
	// attach div element to variable to contain the renderer
	// container = document.getElementById( 'ThreeJS' );
	// alternatively: to create the div at runtime, use:
	//   container = document.createElement( 'div' );
	//    document.body.appendChild( container );
	
	// attach renderer to the container div
	document.body.appendChild( renderer.domElement );
	
	////////////
	// EVENTS //
	////////////

	// automatically resize renderer
	THREEx.WindowResize(renderer, camera);
	
	//////////////
	// CONTROLS //
	//////////////

	controls = new THREE.OrbitControls( camera, renderer.domElement );
	
	///////////
	// LIGHT //
	///////////
	
	// create a light
	var light = new THREE.PointLight(0xffffff);
		light.position.set(0,0,100);
	scene.add(light);
	var ambientLight = new THREE.AmbientLight(0x111111);
	// scene.add(ambientLight);
	
	//////////////
	// GEOMETRY //
	//////////////
			
	var material = new THREE.LineBasicMaterial({color:0x2F4F4F, opacity:1});
	var ellipse = new THREE.EllipseCurve(0, 0, 30, 20, 0, 2 * Math.PI, false);
	var ellipsePath = new THREE.CurvePath();
		ellipsePath.add(ellipse);

	var ellipseGeometry = ellipsePath.createPointsGeometry(100);
		ellipseGeometry.computeTangents();
	var line = new THREE.Line(ellipseGeometry, material);
		line.rotation.set( Math.PI/2, 0, 0 )
	scene.add( line );

	// Sphere parameters: radius, segments along width, segments along height
	var central_geometry = new THREE.SphereGeometry( 2, 32, 32 );
	var central_material = new THREE.MeshPhongMaterial( { color: 0x87CEEB  } );
	var central = new THREE.Mesh( central_geometry, central_material );
	scene.add( central );

	var sphereGeometry = new THREE.SphereGeometry( 2, 32, 32 ); 
	var sphereMaterial = new THREE.MeshPhongMaterial( { color: 0x87CEEB } );
		sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
		sphere.position.x = 30;
	scene.add(sphere);
	// var t;
	
	var sub6_geometry = new THREE.SphereGeometry( 2, 20, 20 )
	var sub6_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
		sub6 = new THREE.Mesh( sub6_geometry, sub6_material );
		sub6.position.x = 30;
	scene.add(sub6);
        
        var sub7_geometry = new THREE.SphereGeometry( 2, 20, 20 )
	var sub7_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
		sub7 = new THREE.Mesh( sub7_geometry, sub7_material );
		sub7.position.x = 30;
	scene.add(sub7);
	// var t6;
	// fog must be added to scene before first render
	// scene.fog = new THREE.FogExp2( 0x9999ff, 0.00025 );

	var domEvents	= new THREEx.DomEvents(camera, renderer.domElement)
	
	domEvents.addEventListener(sphere, 'mouseover', function(event){
		flag = false;
	}, false)

	domEvents.addEventListener(sphere, 'mouseout', function(event){
		// animate(id);
		flag = true;
		sphere.scale.x = 1;
		sphere.scale.y = 1;
		sphere.scale.z = 1;
	}, false)

	domEvents.addEventListener(sphere, 'click', function(event){
		sphere.position.x = 0;
		sphere.position.y = 0;
		sphere.position.z = 0;
		sphere.scale.x = 16;
		sphere.scale.y = 16;
		sphere.scale.z = 16;
		$("#infoBox").dialog("open");
                 
	}, false)
}

function animate() {

	if (flag==true) {
		sub6.position.x = Math.sin(t6*0.1)*30;
		sub6.position.z = Math.cos(t6*0.1)*20;
		t6-=Math.PI/180*2;
                
                sub7.position.x = Math.sin(t7*0.1)*30;
		sub7.position.z = Math.cos(t7*0.1)*20;
		t7-=Math.PI/180*2;
		
		sphere.position.x = Math.sin(t*0.1)*30;
		sphere.position.z = Math.cos(t*0.1)*20;
		t-=Math.PI/180*2;
    };

    requestAnimationFrame( animate );
	render();
	rotar();		
	update();
}

function update() {
	// delta = change in time since last call (in seconds)
	var delta = clock.getDelta(); 
		controls.update();
}

function render() {	
	renderer.render( scene, camera );
}

function rotar() {
// code here
}
</script>

</body>
</html>