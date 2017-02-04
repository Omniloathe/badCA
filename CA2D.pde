/* //<>//
A poor construction of a 2D cellular automata simulator+viewer
 Currently uses mouse to start/stop
 */


public void arrCopy2D(int[][] orig,int[][] copy)
{
  copy=new int[orig.length][orig[0].length];
  for (int i=0; i<orig.length; i++)
  {  
      arrayCopy(orig[i],copy[i]);
  }
}


    public class CA2
    {
      private int[][] cells;
      private int[][] previous;
      private int[][] first;
      private int gen;

      public CA2(int[][] seed)
      {
        this.cells=seed;
        this.previous=seed;
        this.first=seed;
        gen=0;
      }

      private int neighborSum(int i, int j)
      {
        assert(i>=1 && j>=1 && i<=cells.length-2 && j<=cells[0].length-2);
        return cells[i-1][j-1]+cells[i-1][j]+cells[i-1][j+1]+cells[i][j-1]
          +cells[i][j+1]+cells[i+1][j-1]+cells[i+1][j]+cells[i+1][j+1];
      }

      private int updateCell(int i, int j) 
      {
        int state=cells[i][j];
        int sum=neighborSum(i, j);
        if (state==1) //cell is alive
        {
          if (sum>=4) return 0; //dies from overpopulation
          else if (sum<=1) return 0; //dies from loneliness
          else return 1; //stays alive
        } else //cell is dead
        {
          if (sum==3) return 1; //birth
          else return 0; //stays dead
        }
      }

      public void nextGen()
      {
        int[][] newcells=new int[cells.length][cells[0].length]; //too lazy to do proper deep-copy
        for (int i=1; i<cells.length-1; i++) //ignore edges
        {
          for (int j=1; j<cells[i].length-1; j++)
          {
            newcells[i][j]=updateCell(i, j);
          }
        }
        arrCopy2D(this.cells,this.previous);
        this.cells=newcells;
        gen++;
      }
      
      public void prevGen()
      {
        //need to figure out how to calculate previous state
      }

      public void print()
      {
        println("Generation :"+str(this.gen));
        for (int i=0; i<cells.length; i++)
        {
          String s=new String();
          for (int j=0; j<cells[i].length; j++)
          {
            s+=str(cells[i][j]);
          }
          println(s);
        }
        println();
      }

      public void display(float cellsize)
      {
        stroke(0); //black border
        for (int i=0; i<cells.length; i++) //need a macro for this ffs
        {
          for (int j=0; j<cells[i].length; j++)
          {
            if (this.cells[i][j]==0) fill(255); //dead is white
            else fill(0); //alive is black
            rect(j*cellsize, i*cellsize, cellsize, cellsize);
          }
        }
      }

      public int getCell(int i, int j) //accessor method why not
      {
        return this.cells[i][j];
      }

      public void reset()
      {
        this.gen=0;
        arrCopy2D(this.first,this.cells);
      }
      
    }

    CA2 myCA;
    boolean play;
    float cellsize;
    color bgcolor;
    
    void setup()
    {
      size(800, 800);
      bgcolor=color(255);
      int[][] seed={{0, 0, 0, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 1, 0, 0}, {0, 0, 0, 0, 0}}; //spinner
      myCA=new CA2(seed);
      play=false;
      cellsize=40;
      
    }

    void draw()
    {
      if (play)
      {
        background(bgcolor);
        myCA.display(cellsize);
        //myCA.print();
        myCA.nextGen();
        delay(1000);
      }
    }

    void mousePressed()
    {
      /*play= play ? false : true;
      even easier way lol */
      play=!play;
    }
    
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