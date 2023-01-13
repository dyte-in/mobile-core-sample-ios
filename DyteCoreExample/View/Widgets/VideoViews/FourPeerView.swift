//
//  FourPeerView.swift
//  iosApp
//
//  Created by Shaunak Jagtap on 29/08/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import UIKit
import DyteiOSCore
class FourPeerView: UIView {
    @IBOutlet weak var peerOneVideoView: UIView!
    @IBOutlet weak var peerOneHideButton: UIButton!
    @IBOutlet weak var peerOneNameLabel: UILabel!
    @IBOutlet weak var peerOneMutebutton: UIButton!
    @IBOutlet weak var peerOneStatusStack: UIStackView!
    
    @IBOutlet weak var peerTwoVideoView: UIView!
    @IBOutlet weak var peerTwoHideButton: UIButton!
    @IBOutlet weak var peerTwoNameLabel: UILabel!
    @IBOutlet weak var peerTwoMutebutton: UIButton!
    @IBOutlet weak var peerTwoStatusStack: UIStackView!
    
    @IBOutlet weak var peerThreeVideoView: UIView!
    @IBOutlet weak var peerThreeHideButton: UIButton!
    @IBOutlet weak var peerThreeNameLabel: UILabel!
    @IBOutlet weak var peerThreeMutebutton: UIButton!
    @IBOutlet weak var peerThreeStatusStack: UIStackView!
    
    @IBOutlet weak var peerFourVideoView: UIView!
    @IBOutlet weak var peerFourHideButton: UIButton!
    @IBOutlet weak var peerFourNameLabel: UILabel!
    @IBOutlet weak var peerFourMutebutton: UIButton!
    @IBOutlet weak var peerFourStatusStack: UIStackView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        comminInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        comminInit()
    }
    
    func comminInit() {
        let viewFromXib = Bundle.main.loadNibNamed("FourPeerView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func setupUI() {
        peerOneMutebutton.setTitle("", for: .normal)
        peerOneHideButton.setTitle("", for: .normal)
        peerTwoMutebutton.setTitle("", for: .normal)
        peerTwoHideButton.setTitle("", for: .normal)
        peerThreeMutebutton.setTitle("", for: .normal)
        peerThreeHideButton.setTitle("", for: .normal)
        peerFourMutebutton.setTitle("", for: .normal)
        peerFourHideButton.setTitle("", for: .normal)
    }
    
    func renderUI(participants: [DyteMeetingParticipant]) {
        if participants.count > 0 {
            let participant = participants[0]
            self.peerOneNameLabel.text = participant.name
            let participantVideoEnabled = participant.videoEnabled
            DyteVideoUtils().setVideoEnabled(view: peerOneVideoView, enabled: participantVideoEnabled)


            peerOneHideButton.setImage(UIImage(systemName: participantVideoEnabled ? "video" : "video.slash"), for: .normal)
            let participantAudioEnabled = participant.audioEnabled
            peerOneMutebutton.setImage(UIImage(systemName: participantAudioEnabled ? "volume.3" : "volume.slash"), for: .normal)
                            
            let dyteView = DyteVideoUtils().getViewFor(participant: participant, isScreenShare: false)
            dyteView.frame = peerOneVideoView.bounds
            peerOneVideoView.addSubview(dyteView)
        }
        
        if participants.count > 1 {
            let participant = participants[1]
            self.peerTwoNameLabel.text = participant.name
            let participantVideoEnabled = participant.videoEnabled
            DyteVideoUtils().setVideoEnabled(view: peerTwoVideoView, enabled: participantVideoEnabled)

            peerTwoHideButton.setImage(UIImage(systemName: participantVideoEnabled ? "video" : "video.slash"), for: .normal)
            let participantAudioEnabled = participant.audioEnabled
            peerTwoMutebutton.setImage(UIImage(systemName: participantAudioEnabled ? "volume.3" : "volume.slash"), for: .normal)
            
            let dyteView = DyteVideoUtils().getViewFor(participant: participant, isScreenShare: false)
            dyteView.frame = peerTwoVideoView.bounds
            peerTwoVideoView.addSubview(dyteView)
        }
        
        if participants.count > 2 {
            let participant = participants[2]
            self.peerThreeNameLabel.text = participant.name
            let participantVideoEnabled = participant.videoEnabled
            DyteVideoUtils().setVideoEnabled(view: peerThreeVideoView, enabled: participantVideoEnabled)

            peerThreeHideButton.setImage(UIImage(systemName: participantVideoEnabled ? "video" : "video.slash"), for: .normal)
            let participantAudioEnabled = participant.audioEnabled
            peerThreeMutebutton.setImage(UIImage(systemName: participantAudioEnabled ? "volume.3" : "volume.slash"), for: .normal)
            
            let dyteView = DyteVideoUtils().getViewFor(participant: participant, isScreenShare: false)
            dyteView.frame = peerThreeVideoView.bounds
            peerThreeVideoView.addSubview(dyteView)
        }
        
        if participants.count > 3 {
            let participant = participants[3]
            self.peerFourNameLabel.text = participant.name
            let participantVideoEnabled = participant.videoEnabled
            DyteVideoUtils().setVideoEnabled(view: peerFourVideoView, enabled: participantVideoEnabled)

            peerFourHideButton.setImage(UIImage(systemName: participantVideoEnabled ? "video" : "video.slash"), for: .normal)
            let participantAudioEnabled = participant.audioEnabled
            peerFourMutebutton.setImage(UIImage(systemName: participantAudioEnabled ? "volume.3" : "volume.slash"), for: .normal)
            
            let dyteView = DyteVideoUtils().getViewFor(participant: participant, isScreenShare: false)
            dyteView.frame = peerFourVideoView.bounds
            peerFourVideoView.addSubview(dyteView)
        }
    }
}
