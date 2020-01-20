
boolean TESTING = false;
int MAX_SPAWNED = 20;

PGraphics canvas;

Frog test;

void setup() {
  //size(1600, 900, P3D);
  size(1920, 1080, P3D);
  //fullScreen(P3D);

  initScreens();
  initServer();

  // plant files
  initBeauty();
  initStokes();
  initLizard();
  initClasping();
  initObedient();

  // Gen2
  initBlueeye();
  initSleeping();
  initRose();
  initFrog();
  initButton();


  initSpawned();

  // the elements
  initBackground();
  initTerrain();
  initDrops();

  // permanent plants
  initGrasses();
  initPermPlants();


  if (TESTING) {
    spawnFakePlants();
    testingVals();
  }

  smooth(4);
}

void draw() {
  background(0);

  canvas.smooth(8);
  canvas.beginDraw();
  canvas.smooth(8);
  canvas.background(getBackground());

  displayHouse(canvas, int(getBackWater()) -600);


  // ground
  displayGroundTerrain(canvas, -650);


  // plants
  displayGrass(canvas, grasses);
  if (!TESTING)displaySpawned(canvas);
  displayPermanent(canvas);
  displayLiveSpawn(canvas);


  // water
  displayWater(canvas, -370);


  // weather
  //displayClouds(canvas, -1570);
  displayRain(canvas);

  canvas.endDraw();

  renderScreens();
  update();

  //if (TESTING) 
  displayFrames();
}

void update() {
  // plants
  checkForSpawned(1000);
  grasses.grow();
  removeDeadPlants();
  spawnRecurringPlants(1000*15);

  // the elements
  checkThunder();
  checkRain();
  setWater();
  //waterOff();
  setGridTerrain();
  wind();
  playSounds();
}

void displayFrames() {
  fill(0);
  stroke(255, 0, 0);
  text(frameRate, 10, 50);
}

void keyPressed() {
  if (key == 'c')
    toggleCalibration();
  else if (key == 's') {
    saveKeystone();
    //mask.saveMask();
    //saveMappedLines();
  } else if (key == 'l')
    loadKeystone();
}

void testingVals() {
  lifeTimeSeconds = 5;
  rainLasts = 10*1000;
  sunLasts = 10*1000;
}
