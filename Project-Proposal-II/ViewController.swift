//
//  ViewController.swift
//  Project-Proposal-II
//
//  Created by Krouse, William E. on 4/7/26.
//

import UIKit
class ViewController: UIViewController
{
    let members = [("Eli Krouse", "Role:\nBackend, Admin, and Project proposal setter-upper\n\nResponsibilities:\nBuilding the Views in story board, writing the bulk of the code, making sure functionality works/crash checker.", UIImage(named: "EKPFP")),
                   ("Cameron Schulte", "Role:\nUI Designer, Debugger, and UX Dev\n\nResponsibilities: Build and manipulate UI and layouts to make sure they look good on both Iphone and Ipad, as well as creating a cohesion between detail points and overall appearance. Helps with debugging", UIImage(named: "qMark"))]
    
    
    
    let games = [("Tic-Tac-Toe", UIImage(named: "tictactoe")), ("Dots and Boxes", UIImage(named:"dotsAndBoxes")), ("UNSURE", nil)]
    
    let plans = [("User Experience (UX)", "Our UX policy is to keep players from having to fiddle with any settings, besides color. We want the style to be as minimal as possible and to have clean, seamless transitions between views/games. To keep this, we will restrict users from choosing games and who is the in game player."), ("User Interface (UI)", "The User interface will consists of games, settings, and transition screens. Transition screens (wip) will be the beggining screen (with a simple \"start\" button) and (possibly) screens in between games to let the views load and announce the title of the game for player awarness. Mostly everything will be withing classic Apple constraints, with some exceptsion, like how the lines of Dots and Boxes will not have a corner radius of 12, to appear more \"line-like\". We will also aim to have a more aetheticly pleasing app overall, with soft gradients, etc")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch(section)
        {
        case 0:
            return members.count
        case 1:
            return games.count
        case 2:
            return plans.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        switch(indexPath.section)
        {
        case 0:
            cell.textLabel?.text = members[indexPath.row].0
            cell.imageView?.image = members[indexPath.row].2
        case 1:
            cell.textLabel?.text = games[indexPath.row].0
            cell.imageView?.image = games[indexPath.row].1
        case 2:
            cell.textLabel?.text = plans[indexPath.row].0
        default:
            break
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section)
        {
        case 0:
            return "Members"
        case 1:
            return "games"
        case 2:
            return "plans"
        default:
            return nil
        }
    }
}
extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch(indexPath.section)
        {
        case 0:
                if let detailVC = storyboard.instantiateViewController(withIdentifier: "MemberView") as? MemberView
                {
                    
                    detailVC.member = members[indexPath.row]
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
        case 1:
            if let detailVC = storyboard.instantiateViewController(withIdentifier: games[indexPath.row].0) as? GameViewController{
                self.navigationController?.pushViewController(detailVC, animated: true)}
        case 2:
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "PlanView") as? PlanViewController{
                detailVC.u = plans[indexPath.row]
                self.navigationController?.pushViewController(detailVC, animated: true)}
        default:
            print("error in nav push")
            break
        }
    }
}
