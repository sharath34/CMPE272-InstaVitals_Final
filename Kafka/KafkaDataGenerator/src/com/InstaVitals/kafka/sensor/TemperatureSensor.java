package com.InstaVitals.kafka.sensor;

public class TemperatureSensor implements ISensor {
	private static int minimum_temp = 95;
	private static int range = 8;

	@Override
	public Object sense() {
		return (int)(Math.random() * range + minimum_temp);
	}

}
