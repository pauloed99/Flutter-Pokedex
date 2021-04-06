import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';

class PokemonStats extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final Pokemon pokemon;

  PokemonStats({
    @required this.maxHeight,
    @required this.maxWidth,
    @required this.pokemon,
  });

  @override
  _PokemonStatsState createState() => _PokemonStatsState();
}

class _PokemonStatsState extends State<PokemonStats>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  int value;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 1, end: 300).animate(controller)
      ..addListener(() => setState(() {}));
    controller.forward();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.maxHeight * .03),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(widget.maxWidth * .03),
      ),
      height: widget.maxHeight * .35,
      width: widget.maxWidth * .9,
      child: Column(
        children: [
          Text(
            'Estatísticas Gerais',
            style: TextStyle(
              fontSize: widget.maxWidth * .05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.pokemon.stats.length,
              itemBuilder: (_, index) {
                value = widget.pokemon.stats[index].baseStat;
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${widget.pokemon.stats[index].stat.name} : ',
                        style: TextStyle(
                          fontSize: widget.maxWidth * .05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        value: widget.pokemon.stats[index].baseStat /
                            animation.value,
                        minHeight: widget.maxHeight * .015,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: widget.maxWidth * .04),
                        child: Text(
                          '${widget.pokemon.stats[index].baseStat}',
                          style: TextStyle(
                            fontSize: widget.maxWidth * .05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
