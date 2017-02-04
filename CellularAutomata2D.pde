

/*
A poor construction of a 2D cellular automata simulator+viewer
 Currently uses mouse to start/stop
 */



// Need G4P library
import g4p_controls.*;
   
   
   CA2 myCA;
    boolean play;
    float cellsize;
    color bgcolor;
    
   void setup()
    {
      size(800, 800);
      createGUI();
      customGUI();
      bgcolor=color(255);
      int[][] seed={{0, 0, 0, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 0, 0, 0}}; //spinner
      myCA=new CA2(seed);
      play=false;
      cellsize=40;
      frameRate(10);
      
    }

    void draw()
    {
      background(bgcolor);
      myCA.display(cellsize);
      if (play && frameCount%10==0)
      {
        myCA.print();
        myCA.nextGen();
        //delay(1000);
      }
    }

   //void mousePressed()
   // {
   //   /*play= play ? false : true;
   //   even easier way lol */
   //   play=!play;
   // }
    
   void keyPressed()
    {
      switch(key)
      {
        case 'r':
        case 'R':
        play=false;
        myCA.reset();
        background(bgcolor);
        myCA.display(cellsize);
        myCA.print();
        break;
        default:
        break;
      }
    }
    
void customGUI()
{
}
 