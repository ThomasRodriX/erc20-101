const ExerciceSolution = artifacts.require("ExerciceSolution")

module.exports = function (deployer, network, accounts) {
	deployer.deploy(ExerciceSolution)
}