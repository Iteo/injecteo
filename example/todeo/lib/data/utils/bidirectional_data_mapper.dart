abstract class BidirectionalDataMapper<A, B> {
  A to(B data);

  B from(A data);
}
