import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:starter/model/movie.dart';
import 'package:starter/movie_ui/movie_ui.dart';
import 'package:starter/util/hexcolor.dart';
import 'package:starter/question.dart';

class Movies extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

final List movies =[
  "Titanic",
  "Blade Runner",
  "Rambo",
  "Avatar",
  "Avengers",
  "john Wick",
  "HULK",
  "Game of Thrones",
  "hera Pheri",
  "Golmaal"
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies",
        style: TextStyle(
          color: Colors.blueGrey.shade400,
        ),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
          return Stack(
              children:[

              Positioned(
                  child: movieCard(movieList[index], context)),
                Positioned(
                  top: 10,
                    child: movieImage(movieList[index].images[0])),
              ]
            );
        // return Card(
        //   elevation: 4.5,
        //   color: Colors.blueGrey.shade400,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child: Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(movieList[index].images[0]),
        //             fit: BoxFit.cover,
        //           ),
        //         //  color: Colors.black,
        //           borderRadius: BorderRadius.circular(14.0),
        //
        //         ),
        //         child: null,
        //       ),
        //     ),
        //     trailing: Text("..."),
        //    // onTap: () => debugPrint("movie name : ${movies[index]}"),
        //     onTap: (){
        //       Navigator.push(context, MaterialPageRoute(
        //           builder: (context)=>MovieListViewDetails(movieName:movieList.elementAt(index).title,
        //           movie:movieList.elementAt(index) ,
        //           )));
        //     },
        //     title: Text(movieList[index].title),
        //     subtitle: Text( "${movieList[index].title}"),
        //   ),
        // );
      }),
    );
  }

  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 50),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Card(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
              bottom: 8.0,
              left: 30.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(
                         child: Text(movie.title,
                         style: TextStyle(
                           fontSize: 17.0,
                           fontWeight: FontWeight.bold,
                           color: Colors.white,

                         ),),
                       ),
                      Text("Rating : ${movie.imdbRating}/10",
                      style: TextStyle(
                        fontSize: 15.0,
                        color:Colors.black,
                      ),),

                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Text("Released: ${movie.released}",
                    style: TextStyle(
                      fontSize: 15.0,
                      color:Colors.black,
                    ),),
                     Text("Rated: ${movie.rated}",
                       style: TextStyle(
                         fontSize: 15.0,
                         color:Colors.black,
                       ),),
                   ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: ()=> {
    Navigator.push(context, MaterialPageRoute(
    builder: (context)=>MovieListViewDetails(movieName:movie.title,
    movie:movie,
    )))
    },
    );
  }

  Widget movieImage(String imageUrl){
    return Container(
      width: 80,
      height: 80,
      decoration:BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPQDYau3Hs4-xw1i8jVSUY4BlF4FLmg8lQqg&usqp=CAU'),
              fit: BoxFit.cover,
        )
      ) ,
    );
  }

}


//New Route

class MovieListViewDetails extends StatelessWidget {

 final String ? movieName;
 final Movie movie;

  const MovieListViewDetails({Key ? key, this.movieName,required this.movie}) : super(key: key);


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies",
        style: TextStyle(
            color: Colors.grey.shade400,
        ),),
      backgroundColor: Colors.black,
      ),
     body: ListView(
       children: [
         MovieDetailsThumbnails(thumbnail: movie.images[0]),
         MovieDetailsHeaderWithPoster(movie: movie),
         HorizontalLine(),
         MovieDetailsCast(movie: movie),
         HorizontalLine(),
         MovieDetailsExtraPosters(posters: movie.images,)


       ],
     ),
    );
  }


}


















class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank=[
    Question.name("Is Australia the largest producer of wool in the world?",true),
    Question.name("Do camels have three sets of eyelids?",true),
    Question.name("Is Venus the closest planet to the Sun?",false),
    Question.name("Spiders have 6 legs. Is it true or false?",true),
    Question.name("5+9 = 14",false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("lib/images/flag.png",width: 250,height: 180,),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.blueGrey.shade400,
                  )
                ),
                height: 120.0 ,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,style: TextStyle(
                      fontSize: 16.5,
                      color: Colors.grey.shade900,
                    ),),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(onPressed : ()=> _checkAnswer(true),
                    color: Colors.black,
                    child: Text("TRUE",
                    style: TextStyle(
                      color: Colors.white,
                    ),),
    ),

                RaisedButton(onPressed: () => _checkAnswer(false),
                  color: Colors.black,
                  child: Text("FALSE",
                      style: TextStyle(
                        color: Colors.white,
    )),
                ),

                RaisedButton(onPressed: () => _nextQuestion(),
                  color: Colors.black,
                  child: Icon(Icons.arrow_forward,color: Colors.white,),
                ),
              ],
            ),
            Spacer(),

          ],

        ),
      ),
    );
  }

  _checkAnswer(bool userChoice){
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      debugPrint("YES Correct");

      final snackBar = SnackBar(
        backgroundColor: Colors.lightGreen,
        duration: Duration(milliseconds: 500),
        content: const Text('Yay! Correct'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();


    }
    else{

      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
        content: const Text('oops! Incorrect'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();

    }
  }

  _nextQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });

  }
}



class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    // Divider(thickness: 2.3,),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)} ",
                      style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (execution) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  // nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: _purple,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                              color: _purple,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: _purple,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$ ${calculateTotalTip(_billAmount,_personCounter,_tipPercentage)}",style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: _purple,
                        ),),
                      ),
                    ],
                  ),
                 //Slider
                 Column(
                   children: [
                     Text("$_tipPercentage%",
                     style: TextStyle(
                       color: _purple,
                       fontSize: 17.0,
                       fontWeight: FontWeight.bold,
                     ),),
                  Slider(
                      min: 0,
                      max: 100,
                      activeColor: _purple,
                      inactiveColor: Colors.grey,
                      divisions: 10,
                      value: _tipPercentage.toDouble(),
                      onChanged: (double newValue){
                      setState(() {
                        _tipPercentage=newValue.round();
                      });
                      })
                     
                   ],
                 )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount, int splitBy,int tipPercentage){
     var totalPerPerson= (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount)/splitBy;

     return totalPerPerson;
  }

  calculateTotalTip(double billAmount, int splitBy,int tipPercentage){
    double totalTip=0.0;

    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null){

    }
    else{
      totalTip=(billAmount * tipPercentage)/100;
    }
    return totalTip;

  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The purpose of our lives is to be happy",
    "Life is what happens when you’re busy making other plans",
    "Get busy living or get busy dying.",
    "You only live once, but if you do it right, once is enough",
    "Many of life’s failures are people who did not realize how close they were to success when they gave up",
    "If you want to live a happy life, tie it to a goal, not to people or things"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quotes[_index % quotes.length],
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 2.3,
              ),
              FlatButton.icon(
                onPressed: _showQuote,
                icon: Icon(Icons.wb_sunny),
                color: Colors.white,
                label: Text("INSPIRES ME"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIZCARD'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(4.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mayank Gupta",
            style: TextStyle(
              fontSize: 23.2,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("rajmayank93@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("MY new CArd"),
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.red, width: 1.2),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/200/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}
