package com.InstaVitals.kafka.sensor;

public class HeightSensor implements ISensor {
	private static int minimum_height = 152;
	private static int range = 66;

	@Override
	public Object sense() {
		return (int) Math.random() * range + minimum_height;
	}
}
