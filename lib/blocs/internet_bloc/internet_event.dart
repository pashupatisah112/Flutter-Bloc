//no use of internet event so abstract. abstract class'object cannot be made
abstract class InternetEvent {}

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
