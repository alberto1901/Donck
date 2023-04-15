
var deckConstraint =
    walkview.makeUnionConstraint(
        [
         walkview.makePolylinePath(
             [
              [-0.32,    0.00,   3.46],
              [ 6.45,    2.35,   3.11],
              [ 15.37,   1.49,   3.18],
              [ 15.37,  -1.49,   3.18],
              [ 6.45,   -2.35,   3.11],
              [-0.32,    0.00,   3.46],
             ],
             0.20)
        ]);

var walker = walkview.Walker.new("Walk View", deckConstraint);
