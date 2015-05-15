package com.InstaVitals.kafka.sensor;
public class WeightSensor implements ISensor {
	private static int minimum_weight = 20;
	private static int range = 200;

	@Override
	public Object sense() {
		return (int) (Math.random() * range + minimum_weight);
	}

}
