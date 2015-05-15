package com.InstaVitals.kafka.sensor;
public class BPSensor implements ISensor {
	private static int minimum_bp = 90;
	private static int range = 50;

	@Override
	public Object sense() {
		return (int) (Math.random() * range + minimum_bp) + ((int) (Math.random() * range + minimum_bp) % 10);
	}

}
